<%
Class UserCart
    '建立购物车
    Public Sub CreateCart()
        Dim CFlag
        dim mCart(9,0)
        CFlag=CheckCart()
        if CFlag=false then
            For iCount =LBound(mCart,2) to UBound(mCart,2)
             mCart(0,iCount)=""
            next 
            Session("UserCart")=mCart
        end if 
    End Sub
	
    '检查购物车
    Function CheckCart()
        IF IsArray(Session("UserCart")) THEN
            CheckCart = true
        ELSE
            CheckCart = false 
        END IF 
    End Function
	
    '检查购物车是否为空
    Function CheckEmtpy()
        dim mCart
        mCart=Session("UserCart")
        For i =LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then
				CheckEmtpy=false
				Exit Function
            end if
        next
        CheckEmtpy=True 
    End Function
	
    '添加商品
    sub AddItem(id,aName,aPrice1,aguige,acolor,aCount,pic,aid,ajf)  '2008-12-25改进 by tommy 商品增加在最后
        dim mCart
        if CheckItem(id)=false then
            '无此商品
            mCart=Session("UserCart")
			i =UBound(mCart,2)
			'if CheckEmtpy=true and i=0 then
				'i=i
			'else
            	i=i+1
			'end if
			Redim preserve mCart(9,i)
            mCart(0,i)=id
            mCart(1,i)=aName
            mCart(2,i)=aPrice1
            mCart(3,i)=aguige'保留价格参数2
            mCart(4,i)=acolor'保留价格参数3
            mCart(5,i)=aCount
            mCart(6,i)=pic
			mCart(7,i)=aid
			mCart(8,i)=ajf
            session("UserCart")=mCart
        Else
            '有此商品,则商品数量+1
            ModifItem id,aCount,0
        End if
    End sub

	'删除商品
	Sub DelItem(id)  
		dim mCart
		mCart = Session("UserCart")
		l_num=LBound(mCart,2)
		u_num=UBound(mCart,2)
		For i =l_num to u_num
			if mCart(0,i)=id then
				if i<u_num then
					'找到要删除id的下标i，开始转移数据
					For k=i To u_num-1
						For j=0 To 9
							mCart(j,k)=mCart(j,k+1)
						Next
					Next
				end if
				u_num=u_num-1
				ReDim Preserve mCart(9,u_num)
				exit for
			end if
		next
	    session("UserCart")=mCart
	End Sub
 
    '修改商品数量 
    Sub ModifItem(id,mCount,mFlag)
        'mFlag－标志 0－添加 1－修改
        'mID-商品ID
        'mCount－修改商品的数量
        dim mCart
        mCart = Session("UserCart")
		l_num=LBound(mCart,2)
		u_num=UBound(mCart,2)
        For i =l_num to u_num
            if mCart(0,i)=id then
                select case mFlag
                case 0
                    mCart(5,i)= Int(mCart(5,i))+Int(mCount)
                case 1
                    if mCount=0 then
                        mCart(5,i)=0
                        mCart(0,i)=""
						if i<u_num then
							For k=i To u_num
								For j=0 To 9
									mCart(j,k)=mCart(j,k+1)
								Next
							Next
							u_num=u_num-1
							ReDim Preserve mCart(9,u_num)
						end if
                    else
						'response.write mCount
                        mCart(5,i)=mCount
                    end if
                end select
                session("UserCart")=mCart
                exit for
            end if
        next 
    End Sub
	
    '查看推车
    Function ViewCart()
        dim mCart
        mCart=session("UserCart")
        ViewCart=mCart
    End Function
	
    '检查商品
    Function CheckItem(id)
        dim mCart
        mCart =Session("UserCart")
		l_num=LBound(mCart,2)
		u_num=UBound(mCart,2)
        For i =l_num to u_num
            if mCart(0,i)=id then
                CheckItem=True
                exit Function
            end if
        next 
        CheckItem=false
    End Function
	
    '清空购物车
    Sub RemoveAll()
		dim iCart(9,0)
		iCart(0,0)=""
        Session("UserCart")=iCart
    End Sub
	
    '商品普通价
    Function TPrice()
        dim mCart,i
        OutPrice=0.00
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(3,i)*mCart(5,i)
            end if
        next
        TPrice=OutPrice
    End Function
	
	
	'商品总普通会员价
    Function PPrice()
        dim mCart,i
        OutPrice=0.00
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(3,i)*mCart(5,i)
            end if
        next
        PPrice=OutPrice
    End Function
	
	'商品总黄金会员价
    Function HPrice()
        dim mCart,i
        OutPrice=0.00
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(10,i)*mCart(5,i)
            end if
        next
        HPrice=OutPrice
    End Function
	
	'商品总白金会员价
    Function BPrice()
        dim mCart,i
        OutPrice=0.00
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(9,i)*mCart(5,i)
            end if
        next
        BPrice=OutPrice
    End Function
	
	'商品总钻石会员价
    Function ZPrice()
        dim mCart,i
        OutPrice=0.00
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(9,i)*mCart(5,i)
            end if
        next
        ZPrice=OutPrice
    End Function
	
	function getprice()
        dim mCart,i
        OutPrice=0.00
        mCart=session("UserCart")
		if session("person_dj")="z"  then
			OutPrice=ZPrice()
		elseif session("person_dj")="b" then
			OutPrice=BPrice()
		elseif session("person_dj")="h" then
			OutPrice=HPrice()
		elseif session("person_dj")="p" then
			OutPrice=PPrice()
		'elseif TPrice>=3000 then
'			OutPrice=ZPrice()
'		elseif TPrice>=1000 and TPrice<3000 then
'			OutPrice=BPrice()
		else
			OutPrice=TPrice()
		end if
        getprice=OutPrice
	end function
	
	function getnum()
        dim mCart,i
        OutPrice=0
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + 1
            end if
        next
        getnum=OutPrice
	end function
	
    Function Tweight()
        dim mCart,i
        dim OutPrice
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(3,i)*mCart(5,i)
            end if
        next
        Tweight=OutPrice
    End Function
	
	Function Tvolume()
        dim mCart,i
        dim OutPrice
        mCart=session("UserCart")
        for i=LBound(mCart,2) to UBound(mCart,2)
            if mCart(0,i)<>"" then 
                Outprice = Outprice + mCart(9,i)*mCart(5,i)
            end if
        next
        Tvolume=OutPrice
    End Function
	
End Class
%>

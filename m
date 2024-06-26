Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ADDC30653
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaEKHHg6P0MzMqHhiuO+OYXaYKbX+2Km4mH2cJ/1bx4=; b=lYeyBTPx4DtxUb
	pFVN3BBPUcayqQ4rUrC47xmyclcEoIjH6koGzwRH0sDfq8vqENmF6b4rf1OXKEyIXOrkUhtXGAaET
	k/O+MPiHwaLUoYjO7pPLWEEGkXqHKmwQS7Uf7UGBR0omOa1fSD7FFowh2Is52MILY5HXGIYsR1Ne5
	bHVdBkQsUmQW/IlByHoyHa1qISPS3zCHlyAgpmuzhKs7ujjQUxdXUfLzk60DziHKLkmCzfHIx/r+7
	AF54FtxSvxSsgXsI3leaKM7Q5hJz8rr6H4VMJvpxSkJMIjNaO7DvPCJtASmPtEAmGyosXWfUaxhmM
	e/+PKsuK35PLJHeJPo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOWC-000000061mH-3mcy;
	Wed, 26 Jun 2024 09:00:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOW6-000000061kr-3oiw
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 09:00:40 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3EAD9200EE;
	Wed, 26 Jun 2024 17:00:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719392435;
	bh=9t/fdHigGO6Nq7Eu+cEzC770cd6v3TbdxHkxKiQA6MM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lz9mEeQW6VDYNUrh39xiNOap/CnJitO0Box1ywcY0LxMS5saMhcyfJSOepso81Lpf
	 8QlHXBsXqigabErR8uomdJrpJyN6KJuBHx+OJtXr+1WH5CXWboafRnqcdFBszwNlff
	 aeY37Lu4qUisSwWRvSDWHo1GUXp55ZDW1/VJchynzWRBxvUxP8DWsUYXCBao6ysTJt
	 13lF65GQoo0QH2KmZM92eASjqx28lM396S2OQSRK1A8kGQCQmOzhSZkYllIBrTyEbq
	 bUXINsB6lGQA+0oMlzX9ae0T3yiFdEGv17NrWZJsdr160V7CuK7jyrAppUwq4U0GNq
	 z3CDDIlFbDgow==
Message-ID: <d256cd72ef2011c3bfd045b04fb6509d1ac827e9.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Aniket ." <aniketmaurya@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Wed, 26 Jun 2024 17:00:34 +0800
In-Reply-To: <CAMmmMt25nkZTXXLCVGv1baf3azQR0kwbM8LP4EzCQKOPLUhbVQ@mail.gmail.com>
References: <20240626052238.1577580-1-aniketmaurya@google.com>
	 <20240626052238.1577580-2-aniketmaurya@google.com>
	 <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
	 <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org>
	 <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
	 <CAMmmMt25nkZTXXLCVGv1baf3azQR0kwbM8LP4EzCQKOPLUhbVQ@mail.gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_020039_778717_245884FA 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Aniket,

> > For cases where no other special behaviour is required, we can
> > represent this just as an entry in the OF match table.
> 
> Actually I see that IBI support is always present in the HW(DW I3C
> IP). It's just that we have an option in SW to decide whether to
> populate function pointers for IBI or not.

OK, in that case this /definitely/ doesn't belong in the DT then, as
it's purely software configuration.

> So can we remove this selection of ops and always go with ibi ops?

Sounds fine to me, but I don't have direct experience with the non-
ast2600 uses of the dw core.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

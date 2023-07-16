Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCC6EB64DD
	for <linux-i3c@archiver.kernel.org>; Sun, 16 Jul 2023 03:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCIpF7q2o40FiEqvm+066eV7GSbw+XZ+/nZ9KqY3I+M=; b=EDK7Td8PeOa5NO
	w2KNE33uPbWF/AWm/H/sconqDZPFgThidH4KCS6SEcKj2NFubpM2AU5L6knAIAIx4f/r/yygLoqiW
	UF5SzB2jlQ75W2Fvp1FNWj+bJjGDV/1pkHvkIFP0KT3Fi8DlQpVNk3GD8i4Av6/eqP7b13kD408Kj
	rp4M8UMgB0O8N9Zo7rkfO+RN/HNtLkDsy/H+48jWdL4jnaPW8NZXaH0/I3b3XUPtzkkCCl4cgBZOT
	xaz+RcWr5LD3CrJhQ1T6FO+48zcaRzRh/B6NQwoOSKojAMyCKiKOjwtKZ9+VjZCTZ+CxoEmAgZ+i5
	LEQwOiKV+aN/RqAfFLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKsrN-00A0wG-28;
	Sun, 16 Jul 2023 03:55:49 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKsrK-00A0l8-0E
	for linux-i3c@lists.infradead.org;
	Sun, 16 Jul 2023 03:55:47 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8AE392013E;
	Sun, 16 Jul 2023 11:55:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1689479734;
	bh=HNi5zGFs1Mu5yAJOfpUV1Z2gds1fPf/ycyKdnw4VGiE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hG7aQVCIaLg4J9pOkbZ7xLEj5NyZwvTsmwlzhjezf0o3pXGYgpgfTThlnFbOKMn9U
	 Zh5tcLN04zBuQuYyG6jDxFor8EPD4SR0RNBjhl+TQo9rX0l05ALEn4ubHRAzTEVSmX
	 ZhCV4OyFXpOhdCJf+t9WWV66TgjwlfzBh8YWjDOFfHNsQLnC6vsAxGwfMDoKAxHkwn
	 x+71e+5pIYsiY3XCq0rpyAZBRlXbCRPL99vlPHB76gQ+C+GK6JKTI2Py1LUKap07IQ
	 mdDsweIJTi6L40Yw1y6GgcHzZVptEPDkBoKi1qD7DR8foKU7TbjXrUXwPAO8bKmhuq
	 BGMUOqN5Xhbiw==
Message-ID: <36c13d55cdb0a00bd4768b457987042cfc658349.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: Explicitly include correct DT includes
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Przemys=C5=82aw?= Gaj
	 <pgaj@cadence.com>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 16 Jul 2023 11:55:33 +0800
In-Reply-To: <20230714174623.4057784-1-robh@kernel.org>
References: <20230714174623.4057784-1-robh@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_205546_326038_435C2BDC 
X-CRM114-Status: UNSURE (   3.65  )
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

Hi Rob,

> In order to detangle these headers and replace the implicit includes
> with struct declarations

This refers to replacing the implicit includes within the of/ subsystem,
right?

> users need to explicitly include the correct includes.

LGTM, thanks!

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

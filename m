Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384A7D59F58
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 23:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihW+/A7DF7QqJ+wYDLSdRgfCWZ9xP2EfE+GW/DLl/ZI=; b=OEwRSc2P50JlvW
	B6uETlVV/wSW4Jee3JFhbsje72y0BCLt8Roiph4Nc76gJCBxCmmJ0RxSJ+sftWOllgVbG8VVnYkpS
	ymMkEOYIhRSJNIifP3whFVO/epLDg+PE7jSRW2dix1aps1qPZxHMb6cPmxfOufDBm2pHBYcEIhSkh
	Q8yUgqivzbrkt9HvM3sEodCkWPegn9YVkoIF4CKtgBkVP8qzq7BUUVCGe5WyS3nQe/hmbJ20dlZQx
	CaMpN9AwMfvp06Ld4sCcpLXOYJMdmw7QI2X92IWLWmYnC8jm9Dgw+VBaE6rjJX1Gja/ONuvHVx67D
	OhCxdjEBLpvqz4vJfCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCEQ-00000001Ccy-3wJt;
	Fri, 12 Dec 2025 23:07:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCEN-00000001CbZ-3Ggm
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 23:07:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F3381A2149;
	Fri, 12 Dec 2025 23:07:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 252A8606DF;
	Fri, 12 Dec 2025 23:07:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E786103C8DEA;
	Sat, 13 Dec 2025 00:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765580841;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=3LJWKoYZhhsA2sAJ56XZ8R/EOuuvHxRmbQk0zhQ6PwY=;
	b=FtOdSDxdVh5WXZetDheO13iQ/BUoXeFp3w62ynWvhsTsSLfeflaBjiEReuwRJTMLw0JF4h
	o+zWLRiqm+TPbHQWBYtjBCriItEjmyLDbib08Ll2ok9bermTpA/2IS0QYlERvN0cMWWcQC
	DPZFRQHMf8I81iClAbMHBQ7tOflNB3DG9SKl5zQS/oChbZRkBtfWi4Htf16bP8LcMkyTzZ
	FFZmh0gFTuzdGnZbBbhKmtSMImVVAKIDAzUzkT4w43rySvM4LEA9I2vSsuf7RA/gf22vDn
	i60kBXnVqaG2gsXDfc5SEXqak2JVfwlIuSUXsaR4V6D4Tm/pu1fxUsuuRY6gzw==
Date: Sat, 13 Dec 2025 00:07:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] i3c: master: Fix confusing cleanup.h syntax
Message-ID: <176558079621.1405691.2893431970239239781.b4-ty@bootlin.com>
References: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_150724_460369_57A44E84 
X-CRM114-Status: UNSURE (   8.36  )
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

On Mon, 08 Dec 2025 03:07:51 +0100, Krzysztof Kozlowski wrote:
> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:
> 
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem the
> recommendation is to always define and assign variables in one statement
> and not group variable definitions at the top of the function when
> __free() is used."
> 
> [...]

Applied, thanks!

[1/2] i3c: master: Fix confusing cleanup.h syntax
      https://git.kernel.org/abelloni/c/cc3b18f9fede
[2/2] i3c: adi: Fix confusing cleanup.h syntax
      https://git.kernel.org/abelloni/c/136209e6bd98

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

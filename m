Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10803C3DA49
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktbC9mts/jVino+kPKnszOKI6ZUdbxxp964tmAEUuXI=; b=ZFUxRNsAPLeTp+
	TuuKh3RmjbuNFmxNbF0FGgjdn4H6ByKmAJtlqdNVx3wwBvhTy0kXAA93SFhbD2Fs2CIfgbibdu9Y8
	fxO5Cmg5b+OYUohmSi6kiQtsr3TypKYBhnnTl94SazBGJNSY633BYxZwO18VQ5wbMte7DzdF4Jyea
	0nBWEdDvrxuNsfdqDWGdLTREe8UAZ12Hc22pYxNjm0hG73Dqq135XkvlVjuqExD3OkUlns8b/UhMF
	yD2cDEfDEPqO591XI3mepXj8mwGqlu9BSrSuzFF6Si3GfboyhNpEMPaS+9yvWUTdggckZDtaGOmUE
	Xzxop/eGPmLnSHIzOorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPHi-0000000DpOB-39we;
	Tue, 23 Jul 2024 23:51:10 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPHe-0000000DpNB-15zJ
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 23:51:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DFAD240004;
	Tue, 23 Jul 2024 23:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721778661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KiIOw1r8yhLx71uC/aS7jn7kaBhroeWFkE1IfyX8uGs=;
	b=gqf0pAxXRpI71rY/aTbw5S4YJ7ugrB6d4uVFI+ZcC4T/OHC0bPEgEibI4LhMEhP16yxWb6
	BXcN3/tE+q8GA23f8xkWLsr6dtZ7pmedM+hA7+Ny4lotozr5wiT1AXplpKScfHDwPAH3IB
	kv0p+gU8WOJUIII30EZ9vRS2dXNJnrUOU74SLnpwIsu651ciWiv4Og4TcJ4detAA99WQny
	dtytKdjw++fX4k7D1hLMiHR1NxtMkpgORV/1wA/oBciRYTsuOrHh7sSVqSnH07BF83v/XX
	ZQ9G+pM4rDsn+gwFqkeRUeJM0EdmZJQZW6CtGhc4KIU9F2YwVEOJxbDHoNVfVA==
Date: Wed, 24 Jul 2024 01:51:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: Fix error code in
 svc_i3c_master_do_daa_locked()
Message-ID: <172177859262.478132.18174529033943976070.b4-ty@bootlin.com>
References: <e017edfc-da64-496b-8516-958bec27cd9a@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e017edfc-da64-496b-8516-958bec27cd9a@stanley.mountain>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_165106_630987_11A14079 
X-CRM114-Status: UNSURE (   5.85  )
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

On Thu, 18 Jul 2024 13:30:22 -0500, Dan Carpenter wrote:
> This code has a typo so it returns positive EIO instead of negative -EIO.  Fix
> it!
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Fix error code in svc_i3c_master_do_daa_locked()
      https://git.kernel.org/abelloni/c/82a8702d94fd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

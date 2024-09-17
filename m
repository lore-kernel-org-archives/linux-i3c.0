Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C233CAC583
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2024 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfwYCHUufAvzbpbvogZ0K8UliWcIFsQc73pdxm+I7r4=; b=zgxSDs3HPgJii3
	FNmHszpe9xSkq/O/hwGc9MG8Th1falggVT9l0OCXjU7+oTs9PBQLf3BQpaihEHiUycQQo3AfCDjME
	kMiAn5nAC/KwXiPQWOeQJhnAyZ8xxeBsS8dUlMVpeoqqispZLDadq9y0E5sWxCD0TGp/+Pn5cOIzh
	rgmyls9AlaqZxooFPyHPn7K28k0hzktazemcC1DgH/pIQQnjMmQKTvdioPi2ExUIJwblVxXaufMq+
	OZVTEgNWvCvkALUUwDhJBGzO9X2Iuo3TwYzDfaxFZ5/m6UwUH2cloFtxxn/1sPEqUFM7pt+pMHxfM
	8uPHmuZDaQB0Cd5t1OsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZey-00000006Lpb-0lYv;
	Tue, 17 Sep 2024 14:58:32 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZev-00000006LpB-0e01
	for linux-i3c@lists.infradead.org;
	Tue, 17 Sep 2024 14:58:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBA4040004;
	Tue, 17 Sep 2024 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726585105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaBc2O4CmIP1XgLGYsmKKlrDN9ivIYK+vE5FkkijoTI=;
	b=Jxq1uaSJ/XeRnVClcJjBhtug5mzDyI7powIgC1eTaG3O2NV1xyIebagdN71fZM9PiCxGXn
	rsPYeOblz+8deTXpDKQDI1hx/CoYoaVaxEz3gBqrvz7vMok6VJEx3B4NA68UyCipQ44vxf
	P9vGWWll2SjauoD4ZTd+IHc5S6AIsHfK5uIOManyKxKRJpbqzKibE34pYJ9EML07RAJDIZ
	31DBIPqta9lmreLRlX3x+qhi43NTIWHnGDCBxTbXLMAMct+9HMxILTR3bUWngUGwxnxyQ8
	qUYdQqgCqN1y0Vu3iES8v4Z/6mTKG99PTeoyZecqmQMqxRMZuvoR23EZxjQ9ZQ==
Date: Tue, 17 Sep 2024 16:58:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com, frank.li@nxp.com,
	carlos.song@nxp.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: svc: adjust SDR according to i3c spec
Message-ID: <172658508685.68424.14744518376546755348.b4-ty@bootlin.com>
References: <20240719080233.842771-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719080233.842771-1-carlos.song@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_075829_372565_8C7003A8 
X-CRM114-Status: UNSURE (   5.68  )
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

On Fri, 19 Jul 2024 16:02:33 +0800, carlos.song@nxp.com wrote:
> According to I3C Specification(Version 1.1) 5.1.2.4 "Use of Clock
> Speed to Prevent Legacy I2C Devices From Seeing I3C traffic", when
> slow i2c devices(FM/FM+ rate i2c frequency without 50ns filter)
> works on i3c bus, i3c SDR should work at FM/FM+ rate.
> 
> Adjust timing for difference mode.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: adjust SDR according to i3c spec
      https://git.kernel.org/abelloni/c/96267f358c14

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

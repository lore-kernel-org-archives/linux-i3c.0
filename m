Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB07CFEFB5E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RItAkPK+9c+yg/mT+rREuDuzjWiZXbCE81cY83F1cw=; b=0dnLvF/wkMhc+A
	GiF63+wCqwe2wDnBuU6/BObBFIP6UqF1TXKyJHg6vJeCYCog4Wt3FXya7Cze5fvpq9ZNF75MHgDA3
	Ivm5ZizGYwgsXzbEvaWn0URuZb1dZQlKTCEGwxdR+v11xZg2UMwVvm8gK0DiNyNKkt6c+8ML5krsH
	thgB+2LDdyFDdZtkvgx06I/V1c+uc6L3+l2Nc/MLbTXtSVFUV8qd3JpR5j0nKXl/A6Id05gCwWahM
	sCuMSlyCB8AHqlsRkWh1PGimBFY7mMJnfSpr/wE8qpW9LDhRSQazyb51VaeNG+RfIiO5fsVyt6VGB
	8zB+27QGExY7obL9BA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzrP-00000008ee9-2Ujl;
	Fri, 27 Feb 2026 15:34:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzrI-00000008eXY-2b7o
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 15:34:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68CB4C49F49;
	Fri, 27 Feb 2026 15:34:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CD0F5FE46;
	Fri, 27 Feb 2026 15:34:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71B41103682F4;
	Fri, 27 Feb 2026 16:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772206444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=om+ILXLhJC6eYOYq4v80L5Ebke/E4rCiLTomLCU79aU=;
	b=xe3dZhFNZPJfK/ipyEgL/hl+RZ6s6mu2jfTK+6HdWISCrUVTjenydvYCx/gIm3pNL3CzRk
	CA20q+EDUMY3NHtb4jXUgZ8JLkOxZ4CRylK6BuHcj/WLLF84RPvPXLFgdMamlhqwA3ct0M
	wIpr9Hutk5Jhdfxa8lytUOedg+cg/ygaDVjamStXMOrdpzVwJgABOB2bQILoIl+Hi0fXNl
	dUcxKndFAS5eQ2pAazT0PVihh7qP5ZxKmjoRiKPwSNyrF3zA2WFIj2A//epCj1JfXr8siX
	hECAYH3tCX7sJUFg/dari92jFbrRHm8O7fSMMa5fIeeX7Y12oTNzE/LONKeUQQ==
Date: Fri, 27 Feb 2026 16:33:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH] [v3, apply after -rc1] i3c: simplify combined i3c/i2c
 dependencies
Message-ID: <177220641632.201056.5029746753419046340.b4-ty@bootlin.com>
References: <20260204164216.544409-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204164216.544409-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_073431_018714_9A210D7A 
X-CRM114-Status: UNSURE (   9.41  )
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

On Wed, 04 Feb 2026 17:41:58 +0100, Arnd Bergmann wrote:
> All combined i2c/i3c drivers appear to suffer from the same link
> time problem when CONFIG_I3C is set to 'm':
> 
> arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
> mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
> 
> This was previously fixed every time by marking individual
> drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
> tedious and is somewhat confusing.
> 
> [...]

Applied, thanks!

[1/1] i3c: simplify combined i3c/i2c dependencies
      https://git.kernel.org/abelloni/c/663eb8763c25

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

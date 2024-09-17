Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7E0CAC585
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2024 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ksKMImFlJGMtlja7TC8tblstg6UVzyBnnnMpWai1cM=; b=DC5N7GaoCMNBV3
	0K3RmokFdFjKW6rhIl5d2y5QCgCLfLpRVtis9JvWa1qzlkU/8o8HbFiSn0ojCSDLFWNxRRMFyMvv5
	CiPLRv872ms/vonixaBC2fL7Sm/7AL+52DsnLhdemvTZlYzPs89zi7v9NIqyJzdcnOPU1DPhrC5VW
	dLKAejyBe2SCcu3kz3kbl0gvIMoOwJy1UI7kaHOWA2rzUytRif5Pd5xHk3/pGjQSw4CR9CnnDzop8
	FyM7yUCepHnwIUxe5ZxA1zmwqwY/6uwMw9KfcIrKsifg9WJNu0fqaQGfOEuLw8N1beS3m1PSWXEw3
	Ts8PauvzUOd5xaeUaJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZfQ-00000006Lsz-0mOj;
	Tue, 17 Sep 2024 14:59:00 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZfN-00000006LsN-18hK
	for linux-i3c@lists.infradead.org;
	Tue, 17 Sep 2024 14:58:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36AE21C0004;
	Tue, 17 Sep 2024 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726585134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNjBY/yrqiRYcCWR8FN7MlTfLsbuXBXY/h7RcE1c1zM=;
	b=Fe2xLK84IaCCn94GfdEPfB+GrUeTShJDFxjrZ5qo2CPyMZZkIRQjHnI+7OxhgvtNosNkUv
	tXQjcvWQ1zTSUWzSvfYSs/7LL9BzM0885E0okb6+8ahVdPEdtXUWDP3z6faZWzwngN1oNF
	2svjDrP4t9tWK3SG6j1EdalxOR/7WuklE8ygG+XSuJrK1CuWNP0lhcbsdUP3y6GPeH4Er5
	gACcaBCNXWXFBlFra1OO7J2LDCPNLZlQo8s4IlQwTXbskwca4qqvB5CZy6V/xHlgfvV0yY
	RqpypQM9pbI9wvTA47Pgpa9tbm8bU94k6RTxOPPMmwIbGMZDy4330BH5XhhAyw==
Date: Tue, 17 Sep 2024 16:58:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Kaixin Wang <kxwang23@m.fudan.edu.cn>
Cc: 21210240012@m.fudan.edu.cn, 21302010073@m.fudan.edu.cn,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] i3c: master: svc: Fix use after free vulnerability in
 svc_i3c_master Driver Due to Race Condition
Message-ID: <172658508687.68424.10453824473496378760.b4-ty@bootlin.com>
References: <20240914163932.253-1-kxwang23@m.fudan.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914163932.253-1-kxwang23@m.fudan.edu.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_075857_481064_DEB7C868 
X-CRM114-Status: UNSURE (   9.77  )
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

On Sun, 15 Sep 2024 00:39:33 +0800, Kaixin Wang wrote:
> In the svc_i3c_master_probe function, &master->hj_work is bound with
> svc_i3c_master_hj_work, &master->ibi_work is bound with
> svc_i3c_master_ibi_work. And svc_i3c_master_ibi_work  can start the
> hj_work, svc_i3c_master_irq_handler can start the ibi_work.
> 
> If we remove the module which will call svc_i3c_master_remove to
> make cleanup, it will free master->base through i3c_master_unregister
> while the work mentioned above will be used. The sequence of operations
> that may lead to a UAF bug is as follows:
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Fix use after free vulnerability in svc_i3c_master Driver Due to Race Condition
      https://git.kernel.org/abelloni/c/618507257797

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

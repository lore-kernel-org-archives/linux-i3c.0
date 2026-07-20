Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C967C44520
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0V3wCoJ5VUyNBVFN8pOnk1vr86x8igzLGA3nlwSQhsw=; b=oDquIVKN14C6rq
	ROmX+iyJwY8rTfBYAgKfhJdziCv3pdDDeeR1j6XCTEVBv+aEzldTBHs1NA/XFSs5a6Hb9ihsWg56k
	PXZIGuOvu2rGfdWeifLb3V0XfnurJJrOdaLtZRWGm+AxI7tZvCFGLo4+t/Mc9YE0i2LFC2Z6FVZhj
	bW4/p5MTNx6btp18rINV1aQfCMH3OZ03Q6e1EvYXytCodqkXcPb8uZ7Et5GA3cy304ZcvoLsCO+Th
	oiC2nDr9RFcZ3sYQJ1eIqkFsFxOrAp/+DzCboKt6Y03F8VokIEKfc6mQwN/PwnubaNsgXs6fdo4I8
	68aKaIPyf/h2BrQIvYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqar-00000007Jyh-3Re5;
	Mon, 20 Jul 2026 16:11:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqap-00000007Jy3-1cWh
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 16:11:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07BAC1A10FA;
	Mon, 20 Jul 2026 16:11:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF91E60360;
	Mon, 20 Jul 2026 16:11:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3D4611BD3CBB;
	Mon, 20 Jul 2026 18:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784563904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7zQAOgwqGimQJk4NUMye9WI1q6+ui1gQkPlR9udz7uU=;
	b=BuckokiK1DbCFeMHW8m7wLj6lJxR+niVExpybXtkuFSomIpPEY4pOf+MKyRagALG5ozRUY
	/L4paVHINwWIgy2Ot9g+D48Y/JWfhfAVkxEQqQhoqu1h/aIn7mBFhRMs4UWsamf0OR/h4t
	3BxUqqgTpMnXDsrJZHB+h6QqWQGZoRHPwz0DUAGn5Gjt8YaihzEVhWxUCCDYChBq7PqMg9
	LeTqoho6CL7HlLzo8Zdu6JAygkaI3Q0+iQRTVjVWPT+/aVatXtFGF3hEycaPmds44QLQQD
	xxKe6FZuGBuj4DnaxwvsqnbrRaWK9btxHuBVF7+d3HYw675TT2O+lVm3n0tCzQ==
Date: Mon, 20 Jul 2026 18:11:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Fix device_register() error path
Message-ID: <178456389671.83024.8072769249769459844.b4-ty@b4>
References: <20260702183644.60827-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702183644.60827-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_091147_608777_74FFC8C5 
X-CRM114-Status: UNSURE (   5.92  )
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

On Thu, 02 Jul 2026 21:36:44 +0300, Adrian Hunter wrote:
> When device_register() fails in i3c_master_register_new_i3c_devs(),
> put_device() is called to drop the reference taken by
> device_register().  That drops the last reference, so the device's
> release callback i3c_device_release() runs and frees the i3c_device.
> 
> Two problems follow from that:
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Fix device_register() error path
      https://git.kernel.org/i3c/c/a2714ef178e0

Best regards,

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

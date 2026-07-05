Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20DDC43458
	for <linux-i3c@archiver.kernel.org>; Sun,  5 Jul 2026 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eobvpEfQu/2QLTf/F/P0w6wOZLxkQCp+PSPR4M9aeTQ=; b=TPwXQ+fgZQF/XT
	3j+0fJh0plON0S8TkN4GQ2Ckr/wg4YGDLthHeKbxfOKOturn11plU0bWuPB4l8+Y0gsnNbypkXcaX
	yUSDVtnbFiG2uLZkAxvFapkNtezLcX6/xlqs7zlIhX7j3vEKjMZTOqPKp7+ZhKevBa+ZLsGqLagkS
	pLKhKm2/9lKPOMadMKE4Ku84QxeiOtUeQ5YEfxGV3CGhcRE00sZH+ZnyoWjDsz6oR9CAnUTA/WznR
	A8n4W6rUYm/w9vz/nj3eQKkYm05lMn0HT6ILJuYEHWUVfZuq+W0IIRjAUAd7QGzbl5owoap+OJkR7
	itT7deyj1VqXIglRuUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUP7-0000000A29s-2qFC;
	Sun, 05 Jul 2026 21:29:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUP5-0000000A284-20CV
	for linux-i3c@lists.infradead.org;
	Sun, 05 Jul 2026 21:29:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B18DC8EC43;
	Sun,  5 Jul 2026 21:29:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBBCF601A2;
	Sun,  5 Jul 2026 21:29:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 185A111BB8700;
	Sun,  5 Jul 2026 23:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783286969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=3cdlrCY/UEDs7e2DAYmtfE/8rLu7qhR+PO/mhXoMVhs=;
	b=HIVPF8zS9nm5chch6plmYTDopvc6FH2ehboCIBkTfZleuBRJ0mjFt/0yrd7OD8wcQBBj6h
	F08p7hv4htD0QwBIEDokk3fR2v9UDy8mxcQGKF1RrOBwu9wYQMPHkNZSywDoDvT61IQHCh
	bJYh5phVF5bc/aDgNIjZs5s3F00bctNeqmjpdkNNGHe2GfnMJBqulQjkBglJ/67cI9WQHB
	wVEdB/PggUfUiWEgISpTzWqJlfeIU+FXL6cZ0NE+tj5DWXFia1x2AxN5a+Hxyk6PDyuPNs
	2fK2xwePNctZDSOmVCbFjAP3OSJRz/GMrOwEtAw54BQHnHH0dDTM7V4846xYBw==
Date: Sun, 5 Jul 2026 23:29:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jorge Marques <jorge.marques@analog.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: initialize the lock before enabling
 interrupts
Message-ID: <178328692971.58266.7124035364355611229.b4-ty@b4>
References: <20260617150138.628578-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260617150138.628578-1-runyu.xiao@seu.edu.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_142931_690083_A6D07961 
X-CRM114-Status: UNSURE (   6.18  )
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

On Wed, 17 Jun 2026 23:01:38 +0800, Runyu Xiao wrote:
> adi_i3c_master_probe() requests the IRQ and unmasks REG_IRQ_PENDING_CMDR
> before the controller's IBI state, transfer queue list and transfer
> queue lock are initialized.  A pending CMDR interrupt can therefore run
> adi_i3c_master_irq() and take master->xferqueue.lock before the dynamic
> lock has been initialized.
> 
> This issue was found by our static analysis tool and then manually
> reviewed against the current tree.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: adi: initialize the lock before enabling interrupts
      https://git.kernel.org/i3c/c/7296f6898b6d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

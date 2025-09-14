Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD9ACA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VPqVJI1LRmyc6E6Ht/1nzuxh+o5/JQUexizRhGAVGw=; b=nMcq8ky19jBCNl
	HMiahfxz4QHxx4rjM0Vhr1afWVXXkQX3cJh7ISiqYtxPIQ1y6gT7SOrg+tMwQLVonZjN5Sf6uNWxQ
	bAr8OhRBoW4zLyxh3u2mEs6qa1awjA7wByZDmTmVAFC8dYo9MS6TqytGJB4QombsFpA3bkEoVYC0e
	n8ESFlR5MUCHsdVT8HHM9X+uW/U7z4SakfrUn1c3XSYbtxxDPU0ChGyIx14GBZ/bt5v21dhU4tFCA
	tGhYiO+IJ/8wk1lrPBqoWvnZUsJ8F3hr0e45GiWPNQdG/AHYePIO/hadUtF/HBUQkRoHdCWSJrSAp
	xXpOfl5Fm7rr+PgCP3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjA-00000002CCb-0neK;
	Sun, 14 Sep 2025 20:53:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtj7-00000002CAo-1l0W
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:53:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 005874E401F3;
	Sun, 14 Sep 2025 20:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C89AE6063F;
	Sun, 14 Sep 2025 20:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79765102F2A78;
	Sun, 14 Sep 2025 22:53:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HQ8T6B+ejU/9vBjSV6TLHtN/dHQwDrZIyXpYbfx8+7U=;
	b=OvTMYaCU4uOgzwZQUCoMBIDkK8d+4DjCL7bI2dSxVoy4N3hO5XgB+rmZVwJBwSnpDk0KJ+
	qQ7l0eiF9flOJuoNoO2Yk7rwxJgqzNAVkVKhbIbUXujsjLyqBR0L50zszoq+U61iC7sVI7
	OYt7aWxYwE4YWzEh9hDM1gpqs92grfmY8hXI347nfEI05WeyS5UWTFps7sTIC91jh6o/Fh
	e4KN1pUJ5c3E3OYiaDC6DAjrLGrmlgN7Zm6VhvY1RQYFQAxo5HavHPHVNzRr4qLTMSlhce
	2AiSposyRXSMtqH+agrQct8HnXQBDK4rEypSIuXlKRyohT0ezjZIvj+vlxjEUA==
Date: Sun, 14 Sep 2025 22:53:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: git@amd.com, Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
	quic_msavaliy@quicinc.com, Shyam-sundar.S-k@amd.com,
	xiaopei01@kylinos.cn, billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: michal.simek@amd.com, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
Subject: Re: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
Message-ID: <175788312847.382502.8673903984944138470.b4-ty@bootlin.com>
References: <20250730151207.4113708-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730151207.4113708-1-manikanta.guntupalli@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_135337_590076_5DC02FC8 
X-CRM114-Status: UNSURE (   5.88  )
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

On Wed, 30 Jul 2025 20:42:07 +0530, Manikanta Guntupalli wrote:
> Add shutdown handler to the Synopsys DesignWare I3C master driver,
> ensuring the device is gracefully disabled during system shutdown.
> 
> The shutdown handler cancels any pending hot-join work and disables
> interrupts.
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: dw: Add shutdown support to dw_i3c_master driver
      https://git.kernel.org/i3c/c/0b1493337935

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

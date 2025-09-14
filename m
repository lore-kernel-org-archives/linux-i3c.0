Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6134CA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZ75O5ZJdELiDk2P39CFIhsLJGlDjpvWn7jz3ZMn8C4=; b=T+Zo2txBjLrrNl
	K3NrkVChoYrPjQdXIMziv12MdddPRgdovO8tVjTLm+K1lu7sWPhUbCwV+LdGnBZP9Jz3xjHdR6jxx
	BwKRDkHIbI2lnwBt9RBfcybOx+8C76lolGJZlS3ne7GRq/jpaK0vUzKbasFiaeiWH7lysLqLFpP5w
	XGObTyY/YiWOfSgslT8+mlAO0eU8FmRbHLWpxV3aXzpgXE8i/E8c/VWYdwgDhIm9748LXEyv8OV6u
	Wb0oSZZnY5dg+zMD6HiTQWlbmqGZzcShc1uzzM28SWco1+E9mBQLrKwMu7U0AKcq8sIby1JMsV90k
	h5HNtXD9INYTRanzm5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNW-000000029Us-2ShV;
	Sun, 14 Sep 2025 20:31:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtNQ-000000029U0-2jJs
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:31:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A9B744E40BA0;
	Sun, 14 Sep 2025 20:31:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B6E86063F;
	Sun, 14 Sep 2025 20:31:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2ABF102F29EC;
	Sun, 14 Sep 2025 22:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757881861; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=pzUi5sT8IUIj+ELuMNErIZWh1peZpMzA/jd2HcZsY2U=;
	b=ub2zX6UDGIqlYM/Rld6CmptgzZP+ZFyyW4Dmho8s4t+PxblHDTGngEHPWgGN96XCKEJARa
	RW7KD09Ct+SKpeQxRNryOUCZc0fhIRCI605p3690K4Q2NA81mYIje2ymKxx7dfAuVRnE3B
	WxIWFlAI20V5qkiH/Z13EIXir703ZYoAH8Seqxiyll4yZGO2tSSWOWufsfvd2m8XkVzsuY
	mqoUkdJHynS4Jr6Db3nftbgmWX4KU8xYbz2sp7oc2SO6uIsbGweHlhIEHwi9CUCAwgj+o3
	0UG5qKaPqfef/MYGIT78y14gEuvy7VMji+9GlyVnOFl6VxeF16QPfi5OWMrnuQ==
Date: Sun, 14 Sep 2025 22:30:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/5] i3c: mipi-i3c-hci: Convert DBG() prints to dev_dbg()
Message-ID: <175788160627.376561.17978229699793875018.b4-ty@bootlin.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_133113_167529_4EB0265C 
X-CRM114-Status: UNSURE (   4.69  )
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

On Wed, 27 Aug 2025 13:30:04 +0300, Jarkko Nikula wrote:
> A recent error report and reporter's difficulties to enable interrupt
> status prints motivated me to (finally) convert all local DBG() prints
> to dev_dbg().
> 
> Jarkko Nikula (5):
>   i3c: mipi-i3c-hci: Change interrupt status prints to dev_dbg()
>   i3c: mipi-i3c-hci: Remove nonexistent ring interrupt
>   i3c: mipi-i3c-hci: Uniform ring number printouts
>   i3c: mipi-i3c-hci: Remove function enter DBG() printouts
>   i3c: mipi-i3c-hci: Convert remaining DBG() prints to dev_dbg()
> 
> [...]

Applied, thanks!

[1/5] i3c: mipi-i3c-hci: Change interrupt status prints to dev_dbg()
      https://git.kernel.org/i3c/c/a1e05bb05da8
[2/5] i3c: mipi-i3c-hci: Remove nonexistent ring interrupt
      https://git.kernel.org/i3c/c/1ff8dfc6e795
[3/5] i3c: mipi-i3c-hci: Uniform ring number printouts
      https://git.kernel.org/i3c/c/296edf445be0
[4/5] i3c: mipi-i3c-hci: Remove function enter DBG() printouts
      https://git.kernel.org/i3c/c/df92c53a8dff
[5/5] i3c: mipi-i3c-hci: Convert remaining DBG() prints to dev_dbg()
      https://git.kernel.org/i3c/c/4132335d15d5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF20C55164
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIxdzssBGJ/Hh8HGKMgu6QVPXULE0Zt4//bc4+nvEZI=; b=m9XxgM1HkcftAW
	rCTBvQZs3w1OaVw4YLtsygLOytF44lMb9Z9bNqX+QJnMuL5IcgbBAmPK46fM6C/KN+OEjRfXNJKOJ
	2JtreJhovnYJZssV2G9hkhMzWmCefflWcLVKSob1xVRy4zkOdoQbQQ0Hee3Z+mSg7W9YH8049c0rZ
	uoGrS22PyMpx8lBaMuSx5boTSj4ErtR8WgjlWCgwvPMU5DGd6CQExbX0Yzh+VZS1+H2aJpCCfwDC3
	CvuqQwbF3ghioQntJ48qJe8GOPYq59APz4CgeQKF4nFijb1yzL8c5O7/X8z4fT+lGfyGw1MOYegq1
	mvxBzywwpmAOnIAdAoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRy1-0000000AmDp-2phi;
	Thu, 30 Jul 2026 14:42:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRxy-0000000AmDP-49Uw
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 14:42:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB79F4E41009;
	Thu, 30 Jul 2026 14:42:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F582602B8;
	Thu, 30 Jul 2026 14:42:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B28811C15D15;
	Thu, 30 Jul 2026 16:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785422552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hQpafsCqopHAhhKp4bzi6CGQb2lUfWck9EJDz5YyoaQ=;
	b=NJ9nGMnhmdrZXv16VOX8hXEM/Ee7nruqSG9LYnvSmnP8HTzSpJaAoNXuIFWKIjhFtYfDxy
	FH49KbOWqiyudpv/UojgwspXDtsOrqBsaFvWD4mQM+8Ou/vlwD4dCDTFLpCp5ytm5Rj/fD
	7GQxX/ueAK1cSLKW97S1kkizjRIs0SmCSd4N6EUyiFDwjj1NRpMyWNZME+ZY34U9ZBIrsS
	X1cVJMMO3hkY305y9KisjMSAgh8DcWNI/405432SmQ8u90bLTJn1jgNppVkhdRF1dGgAmY
	Ud2fj2DDxCburpmOFdmh+pV/hCHrTcy7JSYSoRNlzSs+0QpyZJVf04ZVho8XJQ==
Date: Thu, 30 Jul 2026 16:42:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: tze.yee.ng@altera.com, lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] i3c: master: require dests for read CCC commands
Message-ID: <178542243598.1793527.5886324593354914574.b4-ty@b4>
References: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_074235_168598_E8105D0C 
X-CRM114-Status: UNSURE (   4.04  )
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

On Thu, 23 Jul 2026 17:23:10 +0800, Adrian Ng Ho Yin wrote:
> Read CCC commands (rnw set) always need a destination array to store
> payload data. Extend the existing direct-CCC validation so cmd->dests
> is guaranteed non-NULL when cmd->rnw is set.

Applied, thanks!

[1/1] i3c: master: require dests for read CCC commands
      https://git.kernel.org/i3c/c/2a99006d4403

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

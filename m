Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840EEE937E5
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAsqE1rce6F7rYYTdbUreuCbdVkvG6bb/muxMX9x7+I=; b=SeRw7NlxMNAwIV
	gbqxnG+z7XqfnzQGgoFbEStGebTPk4bq/4gzixsOx8FNdRUhAaxfuyOW2R8CIHXNgq6jWVkPpd0Yg
	yWochpoqg2ISqefLmjFILAUHECICbMg3mi1/E4BHfcqhMH9EeZMWLHEClVZQgptQViUUOtosNmK1q
	cw2pH6FuWJ5Zjlw63p8SHn/HNMZZDn8F5fiQ7msBVNPJw48S/eRbzC55tk5NNyERvAvLz6Y4bCG1i
	mcbTAMYM1t1hSfDdUtQNFgf8w8kRIfY/5vkGbVn672gkFFoz77KmRqbccPms/skHRWxmnU4j5znuJ
	oVS1P2aRhqkiPQtwF2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwBS-0000000EPMV-450l;
	Sun, 12 Apr 2026 14:53:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwBR-0000000EPLT-0Zf9
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:53:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 928091A323F;
	Sun, 12 Apr 2026 14:53:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67D7B5FFB9;
	Sun, 12 Apr 2026 14:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E70010451B8E;
	Sun, 12 Apr 2026 16:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776005586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cDe2ucezDuoaKLR/zkc7ZGfAeub4oxZOtyYV3akHexw=;
	b=Ld40AVMgFH3jOxnvhzHcxDDiwdf10BPI9VfczLJQxgb7kXE4jkyiMlULJwBtqOtVCx/Lbe
	fFn5+mUq+P27BbEL92j8dkDeVCCp4KfSlCyPtOZf3K3H5gT10u1bcNNKWYZIlcQWn15KLB
	2gqXCeC59rjgRbg2PawqYWkS/436v9Rr4tgz/v3KTxvB9Wt8swNwAgV/gC0JuAbjzuV3y0
	F0aU9+d8JpUL9s8Br3pqZBtjv/a6O3Yp3ATSi9jwCnbl01Auks1I7BWqtrtORRNXevhJ0y
	p0m5ZPNwMGCE5/gTUt/JJUlfV50g3EQPgsxEnyCpQMdpHSeu7pd/8J2dWxeXUA==
Date: Sun, 12 Apr 2026 16:53:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] i3c: master: renesas: Fix a memory leak and use
 __free(kfree) to simplify the code
Message-ID: <177600556367.2788428.15293426044120329273.b4-ty@b4>
References: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_075309_318711_4DAF5D64 
X-CRM114-Status: UNSURE (   4.97  )
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

On Mon, 06 Apr 2026 20:43:15 +0800, Felix Gu wrote:
> 


Applied, thanks!

[1/2] i3c: master: renesas: Fix memory leak in renesas_i3c_i3c_xfers()
      https://git.kernel.org/i3c/c/d7665c3b4f57
[2/2] i3c: master: renesas: Use __free(kfree) for xfer cleanup in renesas_i3c_send_ccc_cmd()
      https://git.kernel.org/i3c/c/57c91ca3dd87

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

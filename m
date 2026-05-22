Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939EACD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aoLwy1IUPDcpWdp6N04bYWvC0e9TkFjpPJxBFtKPJvA=; b=OXNq9glWZlojOP
	wLgX8uJpQ5ynhoMO+GoX19/EUAxZaEhhGyuAz6zXrXOdU9RS5w3hlaE4mCAxmQxQsrp0xyXNOM1Tg
	UuTJQiMbtd1j0vMsEQPLmmEkCrTiw4Adr/2stsFgCb2+ozvr4IOWBhnV16ix8RfQxZutxERFgBeWZ
	MDFM24Sh5d1o7bc2U0AFS3kJYF7TMA1F/IYvZe90NmiWqJTlyBM0TpdRqoAOAuhGmKda7nZNd9TCn
	vEZcNXcDhXgvWB8v16ogwm8kdXUcWrDSsWd+kUh8djexll50wze9EpzRnVh5LarnOMsoCfbd47Kq/
	GJXCfUXd4wqppSobV6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxU-0000000ATrz-1OAp;
	Fri, 22 May 2026 10:18:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxT-0000000ATqM-0lul
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:18:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18A7960204;
	Fri, 22 May 2026 10:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187E61F000E9;
	Fri, 22 May 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445101;
	bh=s6tq9StxoEbiDNdCIQ5hfjPx7p09OfsA8EPreaLNSF8=;
	h=From:To:Cc:Subject:Date;
	b=XNybE/I7GwVDZwSv1DyMKqdqua7C6StYbeQzSxSq79l72DCvyG5UlpVUZQm0lFXQT
	 1gPA+YxQzEa2e4LWUnJHMra/GWVnajUl4W/QjyIUXmdhNViOw1/7bzdCFPxHRgadoV
	 NxRQvVEGAOKSAH2bD/0JXC/YGZ2JuoSy+qij/PJKJurhU8tOlm1suqwLvc0Y+pNQWT
	 dsZJ1sNZNA+ck5d1roGPLrr/nuOzgpm7b5HUuwUa7Topn9bTnzCDChSvCPlqSHleIE
	 YzBr1XhTohUhyRGTPyVSsgluP2u/pBzYrQzLKJ/B8A61exHytMa25J5qQl+wkbVTHe
	 6M3bTiUB1Xj4A==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Fri, 22 May 2026 13:17:58 +0300
Message-ID: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adjusts the suspend to RAM code to handle cases where power
to the connected devices is lost during suspend to RAM. The fixes
included in this series are required for that support.

Along with suspend to RAM support, runtime PM support is also added.
Cleanup patches were included to prepare for clean runtime PM support.

Thank you,
Claudiu

Claudiu Beznea (17):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Use the divider 128
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Fix re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
  i3c: renesas: Clean DATBAS register on detach
  i3c: renesas: Use reset_control_bulk_{assert, deassert}()
  i3c: renesas: Return immediately if there is nothing to transfer
  i3c: renesas: Follow a unified pattern for transfer and command
    initialization
  i3c: renesas: Drop the explicit memset() call
  i3c: renesas: Update HW registers after SW computations are done
  i3c: renesas: Organize structures to avoid unnecessary padding
  i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
    name
  i3c: renesas: Drop unnecessary tab
  i3c: renesas: Add runtime PM support

 drivers/i3c/master/renesas-i3c.c | 378 ++++++++++++++++++++++---------
 1 file changed, 273 insertions(+), 105 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

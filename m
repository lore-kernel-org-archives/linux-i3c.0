Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCC1CD6E57
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWHETaDh0ALynNnyvZmx8uuZepiY0LoTQNU6d7guFMw=; b=bmG+yOTgcfSWLk
	S2ikpAllou44D2OvC/vI3zvAmQicz+oVqLD3FioCqPgk0l2ApsPh9mBSAfGC6CqY73XWwqsL2smyp
	6VsqP5C8/KX+AWGMZuq4NNUDkIy/R8es/DWu97rrQ0GvyeVQgJv5X7YN5Yx+UqZMp7JidF5C2g8qy
	u2ZHbgnUOdtYbYBTiE/0Btzj+8CKNWPwTQXVtFuH7AyF1uaaktTuoTo3E5fHKaYaZYEI/Hmnpe/Tr
	ItctQPk+obZdItZKwkZLpTjPMOfMajROAz6+i5Tzb9dG6hWz/FxpvMfy8+uW3tHuqfpli915qXWQ7
	koaoBbx2W2dDP076y52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPAf-0000000D795-27sU;
	Tue, 02 Jun 2026 13:28:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPAe-0000000D78x-0llx
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EE7960123;
	Tue,  2 Jun 2026 13:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F701F00893;
	Tue,  2 Jun 2026 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406919;
	bh=PuNYbSHmOvmd5G9znrIE3jsvaayxmfOz7PrOCP6ZN5c=;
	h=From:To:Cc:Subject:Date;
	b=CLvvzG6k4Pe8CGuzpYBqyfnD46sJ/Qwem3U6vADiez2yYiazBbbCE2pFvnyvU1PiY
	 NW1OrntD6zXtUZFoQWNR/PPL/pcfTfGq68LAOB/iQ7vDp1pITMdLkdbam7PwX/LsIv
	 i9uyornqTo5TjTPp6qhG5n5bqZ6S19GcWQ1Hq2bAMxJtLpg3yrOFeE+QVFZaLdZEjZ
	 5kUquRCp+uWE0aiLzr+WEx0mxsblH+otSiUBe+oBO+ZloUOQ3lGk04000NAUWMZfBw
	 xFOQi9NjK2cvTOD71dx2lEQLf28k0FKHHRUJpXXwZuWLUcoTCjNhdziXvBSVVJeQ9j
	 1lH0ceidriafQ==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Tue,  2 Jun 2026 16:28:07 +0300
Message-ID: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
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

Changes in v2:
- dropped patch "i3c: renesas: Use the divider 128"
- adjusted the patches title and description where requested in the
  review process
- adjusted the DAA procedure after resume to still properly re-configure
  the controller in case the bus was full before a suspend
- added patch "i3c: renesas: Do not attach devices if xfer failed"
- collected tags

Claudiu Beznea (17):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Reconfigure the DATBAS register on re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
  i3c: renesas: Do not attach devices if xfer failed
  i3c: renesas: Clean DATBAS register on detach
  i3c: renesas: Use reset_control_bulk_{assert, deassert}()
  i3c: renesas: Return immediately if there is no transfer
  i3c: renesas: Follow a unified pattern for transfer and command
    initialization
  i3c: renesas: Drop the explicit memset() call
  i3c: renesas: Update HW registers after SW computations are done
  i3c: renesas: Organize structures to avoid unnecessary padding
  i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
    name
  i3c: renesas: Drop unnecessary tab
  i3c: renesas: Add runtime PM support

 drivers/i3c/master/renesas-i3c.c | 444 +++++++++++++++++++++++--------
 1 file changed, 332 insertions(+), 112 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

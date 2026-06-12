Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE79CD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Giltru41RDeD/JyefQhbXK1lpa9oy/QPrfcwdsWXy98=; b=phaZYioB1Pb4Ti
	Ol14UlH/HAWSk/OfOdbSgZCih0eDi3PNy2mxYpAz7FlRUVaf19RijmdTAC6dkx0bmBLB3espbC5al
	ErmAVBGMEZhX4UxLEeL1L5t0FhxTMxHIBBBraVNMdDEHOpNMWA+QucWxn7NwRtbVpRk7Gwa+1ccgj
	3R+TWQXuEngXvwzUD16VL4v17d55kCEr1ZuPNwC80LZ4z3sK/xq/FH2PJ+aH5YxGNxq6u41eJVxIM
	83nBoiyL3p25OLlCUIf/lpKgslUZqKlCgOKJU/u1uKxjJ1EFV++f+nmArx9bG7ID91h3ykP1TWbIv
	j7rLocLnPa12dtKECw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4NW-0000000BCht-0F10;
	Fri, 12 Jun 2026 16:05:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4NU-0000000BChe-21K8
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:05:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02BFC43532;
	Fri, 12 Jun 2026 16:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774741F000E9;
	Fri, 12 Jun 2026 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280303;
	bh=mj13/P4pFmGLwbyGNiyReg0Yny8dmZLm6qgAmsrPGJI=;
	h=From:To:Cc:Subject:Date;
	b=BGs6yLHJCOo4j+BiGKx3Bi3jWsCPhRj3nA/BXkqUbbmdGH4YqWsTGKAF/O3y7Gw1l
	 MDxxHwghZj8SkOyYhePTpXtYuMTDcIotM9Erh4PQiX4uwy5G+7C55fJk/qeArnPqy7
	 kaRSPjFZxUYaDFl5bjKT9aTSteirH8bYZuHapP8OlqoGrNP/kXMEx48C9DveOkQEBc
	 AzoKl12Ypw79+MROdJVjOOEhlbXxZMpN6fnm14yBGro1xP0QyM1GNE3kAec6xM3NJ8
	 uXvEYdWHPm8NOtcDMOhCMqrXvDEpnNRppjdBtMy5FJMwNQsx3LS71SnhtA/pP1SIWH
	 unZaK7LEzGROA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 00/16] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Fri, 12 Jun 2026 19:04:42 +0300
Message-ID: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
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

Please note that series need to be applied on top of [1] since
patch "i3c: renesas: Perform Dynamic Address Assignment on resume"
uses i3c_master_reattach_i3c_dev_locked().

Thank you,
Claudiu

Changes in v4:
- dropped patch "i3c: renesas: Do not attach devices if xfer failed"
- fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]
  renesas_i3c_irqs_mask_and_clear();
- in patch 16/16 renamed renesas_i3c_abort_xfer() from v3 to
	
Changes in v3:
- re-based on top of series [1] to be able to use
  i3c_master_reattach_i3c_dev_locked()
- used i3c_master_reattach_i3c_dev_locked() on patch
  "i3c: renesas: Perform Dynamic Address Assignment on resume" along with
  grouping the I2C and I3C devices in the driver slot
- collected tags

Changes in v2:
- dropped patch "i3c: renesas: Use the divider 128"
- adjusted the patches title and description where requested in the
  review process
- adjusted the DAA procedure after resume to still properly re-configure
  the controller in case the bus was full before a suspend
- added patch "i3c: renesas: Do not attach devices if xfer failed"
- collected tags

[1] https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#m74ddb24e1e3a8006d933bd6106cc0c4508a11d2c

Claudiu Beznea (16):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Reconfigure the DATBAS register on re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
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

 drivers/i3c/master/renesas-i3c.c | 541 +++++++++++++++++++++++--------
 1 file changed, 413 insertions(+), 128 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

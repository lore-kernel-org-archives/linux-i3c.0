Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2809CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20A6hR6TOORqAZqIQXEPA/Q3lwVBEmBJwv/6pRpS6hQ=; b=mIiLO69isnYvDU
	SQUZfbyoz+TRSLzco0WY8CM97xhKaeif1lt9+zR8nYNfouyUli1N7fk2ne5sToDpuz7oOl/UymC6i
	5OvltSNUwzJSGCg1E/P2PIkh9PzggCWQEKN1KSX8O5F5GVS+uDm+tpigM2pJZ/dZ/w8JjnNgbnXTz
	aCJLKbL6zZbB4pmkpZLny/490l7mrDT70apHixWPR6AcrmlwIQwm2BhQICykF6hd8cJQr6ktLYhY/
	VMqw3B0cSV2MDZ6z6BwxmlN0UE5UemkWI5Dvu5n20ejA0c4Y+LPE26p5jhfrRYRYMZAwW7rekY6X1
	GbA9gSKsGKIDC0BTg6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgO1-00000004LXW-1vNH;
	Mon, 08 Jun 2026 20:15:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgO0-00000004LXM-45hT
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:15:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 733A443503;
	Mon,  8 Jun 2026 20:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67C81F00893;
	Mon,  8 Jun 2026 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949752;
	bh=z0lS06ccDLkZcLq+KluEw1JQFsFbo9sj1movH1YP68Y=;
	h=From:To:Cc:Subject:Date;
	b=RzTnC0HQ2RNzbVx6bDsauK3hzRzUqjEKeVEXiFnxWqmDtQfP8ra46lzE71ff4iiYR
	 gUxPSK/Rvqqdmg5Y6aeYFYiCYOBfPF0EAzMt3F57f3Z3p5FhwuWEb5Mz7k3dMrLrh7
	 UmBUF1nzwoU3TA28pKpD+gP/gj18BE2qkMKNc6Qcu9ho5YczwkwfmrAlbukROB6Qfe
	 VsQ0Lc8/RjioZ0TKAesssUibrEXwYYvtFPc6J2sQ/APcQmApyB8yhz1Ez5lzzGOULM
	 uIuvSiykcA+otmoMnPtAlxy2eDEORVim6eyI243NCUvBFBA9rgN+C60UdvKLSE3SlV
	 GrOPqvGYSg0kw==
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
Subject: [PATCH v3 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Mon,  8 Jun 2026 23:15:26 +0300
Message-ID: <20260608201543.804902-1-claudiu.beznea@kernel.org>
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

 drivers/i3c/master/renesas-i3c.c | 540 +++++++++++++++++++++++--------
 1 file changed, 414 insertions(+), 126 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

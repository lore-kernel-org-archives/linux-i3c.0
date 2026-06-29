Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E0FC43458
	for <linux-i3c@archiver.kernel.org>; Mon, 29 Jun 2026 23:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2BNgs+MqcJ+U0dcRX5V2NKBI/yg11OYX8Tb5RD0AJNs=; b=0P15kfSPnfcZ4H
	FjZ2QxFmW2a8q+D0j8M9GEJnc6K6BCIZKHYu+WFWCL5n9tDSs8DHh9wtzWpfMNRWeSSwteacX/Tmi
	Xoh1MVdPMnV+ID/y7QLUhEz3KAu97CazaSrkt/3qje5dhKCSL+A/NUSgLrG3GZ8GZ+3ZL6JL1vKbe
	x0z7+eXFyjXgU/QlD3rx9kBZ8rKwvMMllpq8f2zynRCK46KZgMD6cTIxOkoai140qxageGuF5rGZg
	QSqc9cpnUng+pnWNfrbEIoCT2wZG1u6dU+lXk/p3BtB1I4+o2vGHPNqM6xMJl1oDGT2l2RgyHIQjf
	XMXlgq3b2aCLyI6vf2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weLXA-0000000FafL-0ypv;
	Mon, 29 Jun 2026 23:37:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weLX8-0000000Faf4-3kkl
	for linux-i3c@lists.infradead.org;
	Mon, 29 Jun 2026 23:36:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 034A460008;
	Mon, 29 Jun 2026 23:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B27A1F000E9;
	Mon, 29 Jun 2026 23:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782776217;
	bh=txKg3k6qk9Nm9dZMJJiw4I+9VgqmALkPN5ol9W7AMn8=;
	h=From:To:Cc:Subject:Date;
	b=j0MO1C7t4ZkheKq6kAqEnI39+qz8/Qib056WXjy74OIISVhCU1EGEqXj1PBHIhmZw
	 9oBsBLEZ6iZUeCYwWoUs9b2tC+PIU8pNnZHFFWn6esJSF7ymaqk1F6dgcu32sfR8pi
	 fA67B0yEnVgNPExRc/Lwel/Q5DahIS1JXKGUSglo1WTGpG1TI2rp3S1dQOWPRj6GXN
	 0ofC12CFeoq7/395JkLgi+Q/EwloqCVf8pEBa5WeHXR9N7Fj6lC+mK89Qp1m8tLOUS
	 G5+8LBtjzauMlmIoe4VcWPi11WE3VLw4pYiP3sE79k7ihM34V5s6NOF8NuYQ1PxcLa
	 r9/yUp+j9HP3A==
From: Jakub Kicinski <kuba@kernel.org>
To: linux-i3c@lists.infradead.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	adrianhoyin.ng@altera.com,
	ustc.gu@gmail.com,
	bbrezillon@kernel.org,
	vitor.soares@synopsys.com
Subject: [PATCH] i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices
Date: Mon, 29 Jun 2026 16:36:50 -0700
Message-ID: <20260629233650.2148827-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
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

On an empty bus ENTDAA assigns nothing, so cmd->rx_len (the count
of addresses left unassigned) equals master->maxdevs.
The GENMASK() index master->maxdevs - cmd->rx_len - 1 then becomes -1,
which trips up UBSAN. We hit this on a Gigabyte/AMD server on
every boot:

    UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:905:12
    shift exponent 64 is too large for 64-bit type 'long unsigned int'
    CPU: 7 UID: 0 PID: 963 Comm: (udev-worker) Not tainted 7.0.11-200.fc44.x86_64 #1 PREEMPT(lazy)
    Hardware name: Giga Computing E163-Z34-AAH1-000/MZ33-DC1-000, BIOS R32_F45 04/01/2026
    Call Trace:
     <TASK>
     dump_stack_lvl+0x5d/0x80
     ubsan_epilogue+0x5/0x2b
     __ubsan_handle_shift_out_of_bounds.cold+0xd7/0x1ab
     dw_i3c_master_daa.cold+0x1b/0x96 [dw_i3c_master]
     i3c_master_do_daa_ext.part.0+0x3e/0xf0 [i3c]

Skip the mask when no new device was assigned.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: alexandre.belloni@bootlin.com
CC: Frank.Li@nxp.com
CC: adrianhoyin.ng@altera.com
CC: ustc.gu@gmail.com
CC: bbrezillon@kernel.org
CC: vitor.soares@synopsys.com
---
 drivers/i3c/master/dw-i3c-master.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..03321edcd0d3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -888,7 +888,14 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
-	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
+	/*
+	 * cmd->rx_len holds the number of addresses ENTDAA left unassigned.
+	 * On an empty bus rx_len == maxdevs, so avoid GENMASK(-1, 0).
+	 */
+	if (cmd->rx_len >= master->maxdevs)
+		newdevs = 0;
+	else
+		newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
 	newdevs &= ~olddevs;
 
 	for (pos = 0; pos < master->maxdevs; pos++) {
-- 
2.54.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

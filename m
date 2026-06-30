Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AECBC43458
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jun 2026 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9z8ggiB1u+tWu9DVp+k89OIfDfhvup3cRi6imMAfOAU=; b=YSLxlxzZVIA66/
	5WAfGVyo3znvVyuts99meYY6COFSp+uDpf9hrB5LUFd4vDld5/Pt/bxD7wmvsm0z9LvT+y401c3DD
	hBrL8YqbcsBUhsb1vNFgqUtX4ysjt2/TB1CaxCVnPC8xeIbq7f0mRlYo1/78TDAm5qpjTR+0j3FtH
	c8l0f3IwsBGtl+wtLFflf7E27Ffc9KYHjjmbEvbzk0uO/2sxyRmNv85TZuzvS+qsykh2/67J+SJgy
	PGp4ZoFrhj8JNnEqWvNnXpc1LoeQ9zTNUHnJvN8Ql8m3OI9cVHLuNQC1wk6Wy2G5k2jo6K+MEN8ga
	Q2n5p1AOHB9OequbZA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecGh-0000000HZNv-3h3j;
	Tue, 30 Jun 2026 17:29:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecGg-0000000HZNk-2nwQ
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jun 2026 17:29:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2654F401C1;
	Tue, 30 Jun 2026 17:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E681F000E9;
	Tue, 30 Jun 2026 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840546;
	bh=Og80t2Bh/k8G5DGkYxM26YDRziAOqHMDeOdbUhE3maA=;
	h=From:To:Cc:Subject:Date;
	b=a1N5dPhPVVDfWXJrgzHdCcjD/zgFD9v/GlKAw4MXaVnQ2nxtsv4OvQ8ocwWMrFXQ9
	 NSKZh86C82sl7wxC9kuWkohoL/NZGwUTe3GZAZdhwpatM0N8R+ZIry9FMnzDwC2X5H
	 goEJM9fOThtacbYu9O1x3WH78kJOL1xFjZ6B1XLbQ9xbFbEOGahdXs3OCAeMzzVnaJ
	 BH0bkmqUj/upzZboI0djuKxKuIteGvgtj3zaj1JX5czbZN1zcknFjBJM/WlFpotjOn
	 60fkFNHNWXVI50kES9QWeBywMtQN6QGThIK625wg3ECEl+jJH9kAS1fscSOhxHaFvp
	 hljXLkQUPl5bw==
From: Jakub Kicinski <kuba@kernel.org>
To: linux-i3c@lists.infradead.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	adrianhoyin.ng@altera.com,
	ustc.gu@gmail.com,
	bbrezillon@kernel.org,
	vitor.soares@synopsys.com
Subject: [PATCH v2] i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices
Date: Tue, 30 Jun 2026 10:29:04 -0700
Message-ID: <20260630172904.2662160-1-kuba@kernel.org>
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
which trips up UBSAN. This happens every time on boot on a Gigabyte/AMD
server:

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
 drivers/i3c/master/dw-i3c-master.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..dc3b74822f8e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -888,7 +888,15 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
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
+
 	newdevs &= ~olddevs;
 
 	for (pos = 0; pos < master->maxdevs; pos++) {
-- 
2.54.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE4AEE6431
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Sep 2023 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ycwygeFcfIPd9d4GqoADlc79lRtvDC6UKbNR9eEFi10=; b=A8E
	C0l1yMp8T7NkGhfLU6wbX9MvY6fpeIu0AIxqYqmJnkvAcrrJqUQrFiGqkcoH5ZtPBqS3cC0O1t750
	zPZu2VzQp+KW2uxfF7dViNVak7Mx/7un8tHndwXUeczIWczDD1kmK1Rs7L3fB8DuAdlMS5U+KwRXc
	Aalo7ZRbu009IcJbZeobLI37hjeTT+KE7LvBo7kwTjs5cXbMXw+gTWxKnuwQR5filkvPhqOdrbbvr
	VJ/yVQupldNLE/l4hjwwjlOnuvevJurVqCJwhsJsqKMpmsFizK2kILxQAmFpX28LMPWjTZWGukFlK
	DN8oKDlzY178pz/fG4ZnvcqE9tshmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3mK-00A6B4-39;
	Fri, 15 Sep 2023 08:02:16 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3mI-00A6Ad-1D
	for linux-i3c@lists.infradead.org;
	Fri, 15 Sep 2023 08:02:15 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58c8b2d6784so23795447b3.3
        for <linux-i3c@lists.infradead.org>; Fri, 15 Sep 2023 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694764932; x=1695369732; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nYHOLD3pC1ETWfuw0uWECAQ4XpRjNOYMe7pbZvIcA3Y=;
        b=a7+4u26nos4JebfyfA0Da17wHa/s2iJKREImuggRSe4iE2SifUqX3WyJUmbXNNE+46
         +MGMKe72nucLb9OrXTRvgs2ylEPTrkoENFGemrPyzQmZPkwaZVBN/9mzmOQtkVk8ij7g
         N5GVjJnmxAyzKOXCTp4PWJrQwE4C41y8t2sTYobcH7z0pKeNVE5xUbOAZeu9uwGukMG4
         XNAedtU6yozSZLh7Cw2/ayHNPAl2etl0wG7kfad6yPJHINU09WpyfehOGl8GvKSC2eHB
         MXaRZof3/wZO8RtC0uZiTLfbkMefE3DWQ24mXcEK+3E2n1TDi8W1SYxEePJfFOFWB8XD
         LfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694764932; x=1695369732;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYHOLD3pC1ETWfuw0uWECAQ4XpRjNOYMe7pbZvIcA3Y=;
        b=UIQPHmDnnhghbTuw7QUpxVZuempeNtPHBCf5PpuH58ElgDXYvuREzN5stYEtMXEjNX
         UKhg/AuGpeenusCYSF4mtdWK2Z9oqql4RcmI7OzFLaFyxPUK0gBvw5ZDEF4kIlxIIntz
         C+2b6Xmv8ea80SvFOwjs55jPDRsJsIWgT0p2alpFVwExfttA2B0Ajcg/UhJIRSKm9kpv
         wsLQK4fZQ0G+cp8xnw537ni1ThMyqys3ECA9XXNcollqa7ja70GlHu7CHUR6cxrPP8sU
         IqdTbsop4n0DVxUZWDnZQx2mzKooBbGLDWybudWtgd5EzMH6Bk0Yy8UawAsC8V5xubJB
         79IA==
X-Gm-Message-State: AOJu0YwPmtmHEoARnLPyDV47e3VUhHN7diO+Fqg5p5soHproCNWDiBn2
	J9DYEuyXG9/h4AU0BgyU0WCa9nf/Eifx101nKWk=
X-Google-Smtp-Source: AGHT+IEBkVpfnKY2Kc1b5lhLbb3lUeKAdHI9zibbYxgIirsFQzqmlHQnNu7KDmP9DNW9umpoOOkxO7YqWTCOMv1mW3w=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a81:ae25:0:b0:58c:b45f:3e94 with SMTP
 id m37-20020a81ae25000000b0058cb45f3e94mr19665ywh.8.1694764932176; Fri, 15
 Sep 2023 01:02:12 -0700 (PDT)
Date: Fri, 15 Sep 2023 08:02:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230915080204.2701640-1-aniketmaurya@google.com>
Subject: [RFC] i3c: master: Simplify table prep for ENTDAA
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@pengutronix.de>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_010214_457364_AB2CCBBD 
X-CRM114-Status: GOOD (  12.24  )
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

Before ENTDAA, device address table is populated with
the dynamic addresses to be assigned to the discovered
devices.
Since these addresses are referenced using consecutive
indices of the table, simply get indices starting
from the last unused position of free_pos. Subsequent
positions are expected to be empty.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 The current way of preparing table seems unnecessarily compilcated.
 The device table index is incremented one by one, so we anyways assume
 that all positions are empty after the last occupied one. So we can
 omit those checks.
 drivers/i3c/master/dw-i3c-master.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9332ae5f6419..dbbc96bc1587 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -782,17 +782,15 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
-	u32 olddevs, newdevs;
 	u8 p, last_addr = 0;
-	int ret, pos;
+	int ret, pos, start_idx, end_idx;
 
-	olddevs = ~(master->free_pos);
+	start_idx = dw_i3c_master_get_free_pos(master);
+	if (start_idx < 0)
+		return start_idx;
 
 	/* Prepare DAT before launching DAA. */
-	for (pos = 0; pos < master->maxdevs; pos++) {
-		if (olddevs & BIT(pos))
-			continue;
-
+	for (pos = start_idx; pos < master->maxdevs; pos++) {
 		ret = i3c_master_get_free_addr(m, last_addr + 1);
 		if (ret < 0)
 			return -ENOSPC;
@@ -811,15 +809,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	if (!xfer)
 		return -ENOMEM;
 
-	pos = dw_i3c_master_get_free_pos(master);
-	if (pos < 0) {
-		dw_i3c_master_free_xfer(xfer);
-		return pos;
-	}
 	cmd = &xfer->cmds[0];
 	cmd->cmd_hi = 0x1;
-	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
-		      COMMAND_PORT_DEV_INDEX(pos) |
+	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - start_idx) |
+		      COMMAND_PORT_DEV_INDEX(start_idx) |
 		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
 		      COMMAND_PORT_ADDR_ASSGN_CMD |
 		      COMMAND_PORT_TOC |
@@ -829,13 +822,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
-	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
-	newdevs &= ~olddevs;
+	end_idx = master->maxdevs - cmd->rx_len;
 
-	for (pos = 0; pos < master->maxdevs; pos++) {
-		if (newdevs & BIT(pos))
-			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
-	}
+	for (pos = start_idx; pos < end_idx; pos++)
+		i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
 
 	dw_i3c_master_free_xfer(xfer);
 
-- 
2.42.0.459.ge4e396fd5e-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

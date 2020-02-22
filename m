Return-Path: <SRS0=ktag=4K=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8E2C35673
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 10:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C813214DB
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 10:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTa3fndv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C813214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BraFyJa0PhTG/9YfQtd8N0siWg6y46QRjnqa4NsrXXQ=; b=tTa3fndv6nr7i5
	E0vwM4rIgXd1WZsy9TQEQ5rHUO9I50vITWXaPsAIF2+LWau4TGeRgioQvnimdVLoj8/tQ+QO5NI2p
	K1FG1wp68KgpGwhA9zWvbvmEH5yISivcTDwJLLJ5zkQR+quc0HLjsbd0ZVtbh3+ebdgVcidkBET04
	HSyzm+woGY40I5XCRA6txaOANpdSdMXehpEq/pX8NBUJd5399XFy55pjxQoE2l3ts1SudpWy6QURR
	/uDio2EfRykHXpAATyrMhqPtHXdX+ykKUWCx89xueN4rcm0ONRZHPDlH1ASLCLt37dkpB/unukNvT
	up7y6f8LvSmmN7oB0WoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5S0O-00062b-NU; Sat, 22 Feb 2020 10:27:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5S0K-00060B-Of
 for linux-i3c@lists.infradead.org; Sat, 22 Feb 2020 10:27:27 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 11BC72912ED;
 Sat, 22 Feb 2020 10:27:21 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>, linux-i3c@lists.infradead.org
Subject: [PATCH 3/3] i3c: Simplify i3c_device_match_id()
Date: Sat, 22 Feb 2020 11:27:11 +0100
Message-Id: <20200222102711.1352006-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222102711.1352006-1-boris.brezillon@collabora.com>
References: <20200222102711.1352006-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_022724_938903_DB2D1FD0 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Simply match against ->match_flags instead of trying to be smart and
fix drivers inconsistent ID tables.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/i3c/device.c | 50 +++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 9e2e1406f85e..bb8e60dff988 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -213,40 +213,34 @@ i3c_device_match_id(struct i3c_device *i3cdev,
 {
 	struct i3c_device_info devinfo;
 	const struct i3c_device_id *id;
+	u16 manuf, part, ext_info;
+	bool rndpid;
 
 	i3c_device_get_info(i3cdev, &devinfo);
 
-	/*
-	 * The lower 32bits of the provisional ID is just filled with a random
-	 * value, try to match using DCR info.
-	 */
-	if (!I3C_PID_RND_LOWER_32BITS(devinfo.pid)) {
-		u16 manuf = I3C_PID_MANUF_ID(devinfo.pid);
-		u16 part = I3C_PID_PART_ID(devinfo.pid);
-		u16 ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
-
-		/* First try to match by manufacturer/part ID. */
-		for (id = id_table; id->match_flags != 0; id++) {
-			if ((id->match_flags & I3C_MATCH_MANUF_AND_PART) !=
-			    I3C_MATCH_MANUF_AND_PART)
-				continue;
-
-			if (manuf != id->manuf_id || part != id->part_id)
-				continue;
-
-			if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
-			    ext_info != id->extra_info)
-				continue;
-
-			return id;
-		}
-	}
+	manuf = I3C_PID_MANUF_ID(devinfo.pid);
+	part = I3C_PID_PART_ID(devinfo.pid);
+	ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
+	rndpid = I3C_PID_RND_LOWER_32BITS(devinfo.pid);
 
-	/* Fallback to DCR match. */
 	for (id = id_table; id->match_flags != 0; id++) {
 		if ((id->match_flags & I3C_MATCH_DCR) &&
-		    id->dcr == devinfo.dcr)
-			return id;
+		    id->dcr != devinfo.dcr)
+			continue;
+
+		if ((id->match_flags & I3C_MATCH_MANUF) &&
+		    id->manuf_id != manuf)
+			continue;
+
+		if ((id->match_flags & I3C_MATCH_PART) &&
+		    (rndpid || id->part_id != part))
+			continue;
+
+		if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
+		    (rndpid || id->extra_info != ext_info))
+			continue;
+
+		return id;
 	}
 
 	return NULL;
-- 
2.24.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

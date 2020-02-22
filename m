Return-Path: <SRS0=ktag=4K=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DEFC35671
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 10:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C59C208C4
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 10:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QnZwW05n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C59C208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+EOGdCfPIuE0Scwi8PpXWy+CaK7H6nggobiA5FP1OQ=; b=QnZwW05n43c0tC
	zoiZAl5g70TAYGTpU258n33b+TSKUp20em2sNp3oCDAry3bmMwy+zmR/hjAuvVTsEaYtnyKztBW9j
	/NvJe8L0cy9gs1SVUyN3aIlJHkXUM75zUrGzmkP7RFy41rD4z2N85Jsz8GzG6rKTPK7qIUnvDOKtE
	7X1G2CPNjgVz2R9dF3C+cSWq6eKmHAMN4H2OlIfFVVTDcMQIx9eeXlZpn2Pr7f0edKZfUS2bTIqj9
	WIkt906F41d1HTXH6TkRVj81+3XqEQPQnZN4hs9CC1Y4nOs/v3XQ3KvMOHl2Ft8HZdVy7hSji+B/B
	PqTJItaIBACgEhRKNVWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5S0O-00061r-KB; Sat, 22 Feb 2020 10:27:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5S0K-000609-Og
 for linux-i3c@lists.infradead.org; Sat, 22 Feb 2020 10:27:26 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9C0FC2963B4;
 Sat, 22 Feb 2020 10:27:20 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>, linux-i3c@lists.infradead.org
Subject: [PATCH 1/3] i3c: Fix MODALIAS uevents
Date: Sat, 22 Feb 2020 11:27:09 +0100
Message-Id: <20200222102711.1352006-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222102711.1352006-1-boris.brezillon@collabora.com>
References: <20200222102711.1352006-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_022724_938018_9D50C617 
X-CRM114-Status: GOOD (  10.10  )
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

file2alias uses %X formatters. Fix typos in the MODALIAS uevent to print
the part and ext IDs in uppercase.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b56207bbed2b..b6db82862a63 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -267,7 +267,7 @@ static int i3c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 				      devinfo.dcr, manuf);
 
 	return add_uevent_var(env,
-			      "MODALIAS=i3c:dcr%02Xmanuf%04Xpart%04xext%04x",
+			      "MODALIAS=i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
 			      devinfo.dcr, manuf, part, ext);
 }
 
-- 
2.24.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

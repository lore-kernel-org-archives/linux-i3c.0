Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED88C00454
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:37:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715FD2077B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/Pkpean";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YDPKO9wz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715FD2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gel5XmcjWVHo96iFqwspsUQ31XNcvW8UqHtnE51kV00=; b=q/PkpeanLi4MrQ2jMZWBfMP0tA
	j41qR7mZJx+8wm2mdIfHscD4KIqEXqImp6ggSlCXFP4qJugCENumXvvlxxlgD4evBepL02mBMv9M/
	/VdW3U5B6PszG56INpUKgVd1FDrm636jt5RqQvdB1BLv1AUWjxg5twWy23hfbC65RovZlMli35JKD
	PVDkLzhq6MjGN6glPYco7h3K4PAURDacbO+KLKjMoVtFga9evm3/cDaDEYkgJ0Qx7zHcMVJzCRTqK
	RCRlBACp9H1TgxTmBjYlExmjsKh8fAN0ZyyJAle6UYqj07oweNl2gaQy1kasdT8wmQuUcmaggAsgM
	qRDjrR9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieha2-0003wW-Ju; Tue, 10 Dec 2019 15:37:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iehZz-0003qN-RR
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 15:37:41 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8A2B9C00BC;
 Tue, 10 Dec 2019 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575992259; bh=wCGz21uv5jylmEZ0nnnjoDbbVduGA33/JL1HaoI4a4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=YDPKO9wzoyy39bw6iC7+R76kinU7HKu9ki7xlgNpkouzr6ES2FCtj56iRAgaPfe+Q
 ZIR9oIHNjzEildKY/ywHeHs4otRepS3e4WCOEoqPV8vXSYNRDhDqLJGEppwH5Yy6VB
 KVRXF+mk1PhEcJQURZ12MKLYx/Z7ZFQHLFAI7YCEI6ylywYo2x+5ZJaJrlANuH0DYO
 gEC24w6H1pFeGejXf+E77nQiAcdVTuPCXd3o3+ufxOKvtSHO6winoIcUFnljbJ4pDW
 uNDmuelsw1zoLpVCyB1kMDpGpv/ZhkUTZA65gGNilmn4Kg9m0KnemZh+5o3ZAAqny8
 kzDPkFLhAHmqQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 96528A0062;
 Tue, 10 Dec 2019 15:37:36 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 6D4D23E2D0;
 Tue, 10 Dec 2019 16:37:36 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [RFC 1/5] i3c: master: export i3c_masterdev_type
Date: Tue, 10 Dec 2019 16:37:29 +0100
Message-Id: <e6300a989b856e77bab8e57a71ae30b18ced8b3d.1575977795.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575977795.git.vitor.soares@synopsys.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1575977795.git.vitor.soares@synopsys.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_073739_933635_9B3A2B27 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: Joao.Pinto@synopsys.com, arnd@arndb.de, wsa@the-dreams.de,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, broonie@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Export i3c_masterdev_type symbol so i3cdev module can verify if an
i3c device is a master device.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/internals.h | 1 +
 drivers/i3c/master.c    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86b7b44..bc062e8 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,7 @@
 #include <linux/i3c/master.h>
 
 extern struct bus_type i3c_bus_type;
+extern const struct device_type i3c_masterdev_type;
 
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0436916..a1fb5f7 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -523,9 +523,10 @@ static void i3c_masterdev_release(struct device *dev)
 	of_node_put(dev->of_node);
 }
 
-static const struct device_type i3c_masterdev_type = {
+const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
+EXPORT_SYMBOL_GPL(i3c_masterdev_type);
 
 int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 		     unsigned long max_i2c_scl_rate)
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

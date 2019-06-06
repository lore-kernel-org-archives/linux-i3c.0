Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE96CC28EB4
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85C820652
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfZV3AA4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="epaHTtua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85C820652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1W0pfFGoUxAC5XbBT0GGMTCF6/voqvMIDKfjBet8g+k=; b=tfZV3AA45dbImvzOzds3XPPV29
	AhvjK91n6HEexJx3JS9fm/vdOoV+eJaZLVH0BqjMpZyUrEObuYM6PMZyIpwfVSvgy8u5kO6LEVRx8
	U71GDjiFaXogT261+nNFK2tvUixyfR4RUT8j8hJTA7P4C6FWbc51Y8FEDPlz0Iyh2HtRzvtMk6v5G
	518oGSOK2liD5TL3NKtqk+HZaXgj+V32fJCqb7qj0u+2I/3lpu1S826mRWpOf2Rev0XQvMlSJzHFq
	53yOJuYNqbHZHE3ya2rNxtjI7QTV30w9FnkUFNRresocbW/qzyA2lBssPz9mNtPtHl7rUYixdeMCu
	5IQUFH0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYswB-0004aU-7V; Thu, 06 Jun 2019 14:00:15 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYsw9-0004YS-2t
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 14:00:14 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25C51C0B9F;
 Thu,  6 Jun 2019 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559829589; bh=6XGIkYC8pr3tc2Zq6ZaUBCFOv5OZZX8H6H8+9IoAnSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=epaHTtuav4+i5QQdICoqbuS0LTHYQ1U93qVfR8Ii2dDtaMGGHImIVNgmzjaljf6d2
 ngU1+FJEv0DfJBLgjA5c2vJjulpcS8ZLypQHDDoEI2rQXPqSIb9S532y4PL+328Obq
 2NT7wQBU1Mm4cc5F7lPIN5mboS3jFiL6owHQhVz0m2uK5gJpdz+AlkJ9GN8IrEU+xp
 vb0wK5s5AaJphx9KC1hYByPt8DXdPbQJ5xlAfLl7ac15AhWrvI86HfW6ansGLtlmQi
 mMUK4XcBKNj/1PPYzCDvLcJC9sLqswtBQIdbv90f/4VlFURih6f4ACfIzKTpeIcBz7
 OVIbI/o6MokJg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id D484EA0057;
 Thu,  6 Jun 2019 14:00:08 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id C35D43F6D1;
 Thu,  6 Jun 2019 16:00:08 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v2 2/3] i3c: add mixed limited bus mode
Date: Thu,  6 Jun 2019 16:00:02 +0200
Message-Id: <47db801ee13bd7a831c1cc24353653ea0ddd3721.1559821228.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559821227.git.vitor.soares@synopsys.com>
References: <cover.1559821227.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1559821227.git.vitor.soares@synopsys.com>
References: <cover.1559821227.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_070013_138229_7307278A 
X-CRM114-Status: GOOD (  12.74  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The i3c bus spec defines a bus configuration where i2c devices don't
have a 50ns filter but support SCL running at SDR max rate (12.5MHz).

This patch introduces the limited bus mode so that users can use
a higher speed in presence of i2c devices index 1.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
---
Changes in v2:
  Enhance commit message

 drivers/i3c/master.c       | 5 +++++
 include/linux/i3c/master.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 8cd5824..f446c4d 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -470,6 +470,7 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
+	[I3C_BUS_MODE_MIXED_LIMITED] = "mixed-limited",
 	[I3C_BUS_MODE_MIXED_SLOW] = "mixed-slow",
 };
 
@@ -585,6 +586,7 @@ int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
 		break;
 	case I3C_BUS_MODE_MIXED_FAST:
+	case I3C_BUS_MODE_MIXED_LIMITED:
 		if (!i3cbus->scl_rate.i3c)
 			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
 		if (!i3cbus->scl_rate.i2c)
@@ -2490,6 +2492,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 				mode = I3C_BUS_MODE_MIXED_FAST;
 			break;
 		case I3C_LVR_I2C_INDEX(1):
+			if (mode < I3C_BUS_MODE_MIXED_LIMITED)
+				mode = I3C_BUS_MODE_MIXED_LIMITED;
+			break;
 		case I3C_LVR_I2C_INDEX(2):
 			if (mode < I3C_BUS_MODE_MIXED_SLOW)
 				mode = I3C_BUS_MODE_MIXED_SLOW;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f13fd8b..89ea461 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -250,12 +250,17 @@ struct i3c_device {
  *			     the bus. The only impact in this mode is that the
  *			     high SCL pulse has to stay below 50ns to trick I2C
  *			     devices when transmitting I3C frames
+ * @I3C_BUS_MODE_MIXED_LIMITED: I2C devices without 50ns spike filter are
+ *				present on the bus. However they allows
+ *				compliance up to the maximum SDR SCL clock
+ *				frequency.
  * @I3C_BUS_MODE_MIXED_SLOW: I2C devices without 50ns spike filter are present
  *			     on the bus
  */
 enum i3c_bus_mode {
 	I3C_BUS_MODE_PURE,
 	I3C_BUS_MODE_MIXED_FAST,
+	I3C_BUS_MODE_MIXED_LIMITED,
 	I3C_BUS_MODE_MIXED_SLOW,
 };
 
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

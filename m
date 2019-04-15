Return-Path: <SRS0=HC+M=SR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82361C282DD
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 18:46:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE9D218FC
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 18:46:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kgjUSNVl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QpHKQExW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE9D218FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f5E9Pszq0QE587QjJqLya5zkldSfh8hS5O+2vnElUME=; b=kgjUSNVlEQ1h2+3czBuB5UUsHQ
	a+P4MjKh4cv+Pi+W2wBKO5nTybbAY2BRZm7Vr/j29zw6V6a3lUmKcJrsa1Lwdk25EmaH0xD/SeiSM
	9pEHP872Xx9z0xYJrR3qSGjssUOa0p176e8wxnQmstd7V39H0IF8pjIhX6+PHjAjsi5vLoZcjK/+J
	ORkSNios94Xoe25SnE/kfJH4H0rzGLZuAlffWFwu4tP0K/FSRN/ghDvU5mAqK/awKUXM06WnaNASS
	2FBDiRwtWTTFkWKS7ZOoIoTeZo2O+95looe1vfwuLbJ2p3I1m0Z4XFO8t8ZvKI6Lv5w6j22X+Wfj2
	lV1WLLTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG6d6-0003vU-VT; Mon, 15 Apr 2019 18:46:56 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG6d3-0003u4-PF
 for linux-i3c@lists.infradead.org; Mon, 15 Apr 2019 18:46:55 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id F26BD10C1084;
 Mon, 15 Apr 2019 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555354011; bh=n6inYUl0YHNqBHgFN/exfZfs4AjaXGG9AEqyDA7rheA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=QpHKQExWp3HSwvCwZXncuLsmdtCh2MQEaJaSugUeYLVOSYURwQVR1QA1sqJJUh+zf
 MXeEwMIywkkCMI+TFz+gsJFQdbLRZv04ZfqvyZQLYlEv3Id9iWF8TZbeHb5RM9UsBG
 D+BwF7fRuwhfeh9faRHmILIwpPTcqL7eTu3e5ZWNGw9rjALwt59jK2wWgLOFq/nc78
 +6hf5wGP5pZngNIc+3gaGjIwyBYh4p42i5nIhEkJ9bYNMsMVGKEPzjICBK0wm9o2aX
 l+YCO+QYPv0hC81OsBo3i9eIQ219Lr+2BgBXaM8d/ekXsnhaIRCcvqpzl1FdUJ/wfO
 BFFe0XEolDKVQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id AF22E5B73;
 Mon, 15 Apr 2019 11:46:49 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH 2/3] i3c: add mixed limited bus mode
Date: Mon, 15 Apr 2019 20:46:42 +0200
Message-Id: <a3bf32dadd9b0135442526cc77fec5726e6e617d.1555350118.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1555350118.git.vitor.soares@synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1555350118.git.vitor.soares@synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_114653_876609_61357797 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: joao.pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The i3c bus spec define a bus configuration where the i2c devices
doesn't have the 50ns filter yet they allow the SDR max speed.

This patch introduce the limited bus mode so the users can use
a higher speed on presence of i2c devices index 1.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
---
 drivers/i3c/master.c       | 5 +++++
 include/linux/i3c/master.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 1c4a86a..46d3774 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -463,6 +463,7 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
+	[I3C_BUS_MODE_MIXED_LIMITED] = "mixed-limited",
 	[I3C_BUS_MODE_MIXED_SLOW] = "mixed-slow",
 };
 
@@ -575,6 +576,7 @@ int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
 		break;
 	case I3C_BUS_MODE_MIXED_FAST:
+	case I3C_BUS_MODE_MIXED_LIMITED:
 		if (!i3cbus->scl_rate.i3c)
 			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
 		if (!i3cbus->scl_rate.i2c)
@@ -2481,6 +2483,9 @@ int i3c_master_register(struct i3c_master_controller *master,
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
index 44fb3cf..740235e 100644
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

Return-Path: <SRS0=yyII=UK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011EFC43218
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2019 14:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD3AC206BB
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2019 14:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mj0sY8NQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V0oDQSJW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD3AC206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EMyanq9S6ZaAlGSY9/KVOG6nHMFyFx84WYTux6U5qac=; b=mj0sY8NQTPVY1+hl+/nc/zhyaV
	Rvqz5dx4CKHbagZNZgqK6meEUfQ7O36Ekz3ML4ewkXvI5DmYETbqCUY4KvP6aSl7xqn8DFPD04BYy
	7s9BQZnFRdlv2LUyEXS5zOZvw5vydePrX5c63+2CJn9bQ+vfutxmeRUe8hZVpz5YSvbhZVF+lheMN
	CMmCSrScRGigxLZOLOJuH0qW7pmlddXB5+8JFK9fLb86B65nMrqEyFKPmg3GiVrCcNHlTJLh0Czc2
	cywX827umDl6JOalruxV/CElucry8Nb2UtJI8kcZtSMYQrSDeZZfpjZu2HuSyCxzIiii7B3IE7QmE
	3odMpJ+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hahQP-0000q7-GN; Tue, 11 Jun 2019 14:06:57 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hahQL-0000oA-6k
 for linux-i3c@lists.infradead.org; Tue, 11 Jun 2019 14:06:55 +0000
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C28C9C592D;
 Tue, 11 Jun 2019 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1560262009; bh=Y3sMwfqtu4jhDptZ3O+9CpvF/YCnpXaDr+JEzu9WStQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=V0oDQSJWcbW9rULv+rQZi0QdFm65nx0FnUhjRyVKpb14nhfZ5VhigsF0u3onBxcIR
 I6zrGzMI1ZtnOQpWhWGEDKLL+O7M7/gR57n3MBUCbUOAXT5WspJQv88UrldQtS/Hig
 MYZUZd/QPpzOx8YGvxGh7rIrTaQv/iSheo7FmrdeVUheIoyo7DqN9k49ElYki4POCr
 mvRrEl1mKN0etb2h/z6rU2qpyl4NeULe8T1WIYqlvMwXX6M31G6WoCUnI8i2TcuMLd
 N42IrDnkk0IxOFS0kmJavq/mrjMhX2dDjaf/WD2MZr8l6J6B0H1GasTXZq+DUjBTg2
 Aq20zxWEyICuA==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2D844A022E;
 Tue, 11 Jun 2019 14:06:48 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id DAECD3F591;
 Tue, 11 Jun 2019 16:06:48 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3 2/3] i3c: add mixed limited bus mode
Date: Tue, 11 Jun 2019 16:06:44 +0200
Message-Id: <cdfdf31d1e52b7569f686c50e6f56163d21d8b36.1560261604.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560261604.git.vitor.soares@synopsys.com>
References: <cover.1560261604.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1560261604.git.vitor.soares@synopsys.com>
References: <cover.1560261604.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_070653_262516_44587CA5 
X-CRM114-Status: GOOD (  12.27  )
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
Changes in v3:
  None

Changes in v2:
  Enhance commit message

 drivers/i3c/master.c       | 5 +++++
 include/linux/i3c/master.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f8e580e..025925c 100644
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

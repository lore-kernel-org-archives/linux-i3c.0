Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D1E75433
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Oct 2023 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=woNk5No1NE4HKapkM94dcTH3WPrXfl5jljlRv1bSq4c=; b=FGx6hkuTZ5FgmK
	l1lEUxCZY9N4vCSn95lfGSSQ3/xHVu6OZMe1yoO79p6v87KRB5qqBR6z8sm05foaHEs7v1FkQmr3R
	WurmxdwjC+u0XvPtxTYjAkTa1Fl3R9t7O3pqQnx7Nyy/XHu+kKGZ2hQr4rBXy592Fzusf8SDDyX+2
	att0TfjmVQFoJqGuZMI9H3VjxPv+BvMsXpX8pbDhz6cH0OdTxBro7cADw1D0ZrNfeGqqpdPmw7v89
	8pNIe34+fJr5tTfIRvv4NBgJm0k+lhek6TuwAta4wMRNFk/Ukjec4Ty7Zi+FeYYXvMu9AiTp2BfX0
	SJjqyEpaVEmcZ8dUpxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaEI-00E1dJ-3C;
	Tue, 03 Oct 2023 07:54:06 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaEG-00E1cd-0o
	for linux-i3c@lists.infradead.org;
	Tue, 03 Oct 2023 07:54:06 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 0876120239; Tue,  3 Oct 2023 15:54:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696319640;
	bh=vsBp77p7CDhHRULJIIRilyCY9D7df8p0W5nYzOmlxYk=;
	h=From:To:Cc:Subject:Date;
	b=dIb2/5uzvw6ksgomcS/2UUZ3ci7UKGcfHjSx3urC/mT6neS33iN3PVpajlxoKLVFT
	 zO9xv1n/2YhMYfUfiBTcFnksIBcaLJAbkrVqRt22hffdjm6LpUZUgw5OPMCOCJNY1+
	 WGcyb14aDdOeLKI0sX9WaK0xRQFbCxjUVgleH1BFSTxf5at4PPY7yO6sFAeMdzTiRW
	 /YRElUnBycEep4xzDzivLjYlRJ4aHqIPlLvC1csGgDUFU2fakHLWjWSI5vRzIYaRm1
	 P7jbrKRDbINMGIwCoN5oCAI0wzU6w/ZTKVZ/W+qgtCGZRKjZJoZUaeiFlKFwScsNzI
	 pKKJlIbVPSS6g==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-kernel@vger.kernel.org (open list),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] i3c: Fix typo "Provisional ID" to "Provisioned ID"
Date: Tue,  3 Oct 2023 15:53:39 +0800
Message-Id: <20231003075339.197099-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_005404_730144_B1F1D30B 
X-CRM114-Status: GOOD (  17.44  )
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

The MIPI I3C spec refers to a Provisioned ID, since it is (sometimes)
provisioned at device manufacturing.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 Documentation/ABI/testing/sysfs-bus-i3c        | 4 ++--
 Documentation/devicetree/bindings/i3c/i3c.yaml | 4 ++--
 Documentation/driver-api/i3c/protocol.rst      | 4 ++--
 drivers/i3c/master/svc-i3c-master.c            | 2 +-
 include/linux/i3c/device.h                     | 2 +-
 include/linux/i3c/master.h                     | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
index 1f4a2662335b..e5248fd67a56 100644
--- a/Documentation/ABI/testing/sysfs-bus-i3c
+++ b/Documentation/ABI/testing/sysfs-bus-i3c
@@ -67,7 +67,7 @@ What:		/sys/bus/i3c/devices/i3c-<bus-id>/pid
 KernelVersion:  5.0
 Contact:	linux-i3c@vger.kernel.org
 Description:
-		PID stands for Provisional ID and is used to uniquely identify
+		PID stands for Provisioned ID and is used to uniquely identify
 		a device on a bus. This PID contains information about the
 		vendor, the part and an instance ID so that several devices of
 		the same type can be connected on the same bus.
@@ -123,7 +123,7 @@ What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/pid
 KernelVersion:  5.0
 Contact:	linux-i3c@vger.kernel.org
 Description:
-		PID stands for Provisional ID and is used to uniquely identify
+		PID stands for Provisioned ID and is used to uniquely identify
 		a device on a bus. This PID contains information about the
 		vendor, the part and an instance ID so that several devices of
 		the same type can be connected on the same bus.
diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index ab69f4115de4..f8ac7a3e3123 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -119,12 +119,12 @@ patternProperties:
                 minimum: 0
                 maximum: 0x7f
               - description: |
-                  First half of the Provisional ID (following the PID
+                  First half of the Provisioned ID (following the PID
                   definition provided by the I3C specification).
 
                   Contains the manufacturer ID left-shifted by 1.
               - description: |
-                  Second half of the Provisional ID (following the PID
+                  Second half of the Provisioned ID (following the PID
                   definition provided by the I3C specification).
 
                   Contains the ORing of the part ID left-shifted by 16,
diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
index 02653defa011..23a0b93c62b1 100644
--- a/Documentation/driver-api/i3c/protocol.rst
+++ b/Documentation/driver-api/i3c/protocol.rst
@@ -71,8 +71,8 @@ During DAA, each I3C device reports 3 important things:
   related capabilities
 * DCR: Device Characteristic Register. This 8-bit register describes the
   functionalities provided by the device
-* Provisional ID: A 48-bit unique identifier. On a given bus there should be no
-  Provisional ID collision, otherwise the discovery mechanism may fail.
+* Provisioned ID: A 48-bit unique identifier. On a given bus there should be no
+  Provisioned ID collision, otherwise the discovery mechanism may fail.
 
 I3C slave events
 ================
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 32eca2d6caf0..e23d7900c5a1 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -765,7 +765,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 			u8 data[6];
 
 			/*
-			 * We only care about the 48-bit provisional ID yet to
+			 * We only care about the 48-bit provisioned ID yet to
 			 * be sure a device does not nack an address twice.
 			 * Otherwise, we would just need to flush the RX FIFO.
 			 */
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 90fa83464f00..84ed77c04940 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -96,7 +96,7 @@ enum i3c_dcr {
 
 /**
  * struct i3c_device_info - I3C device information
- * @pid: Provisional ID
+ * @pid: Provisioned ID
  * @bcr: Bus Characteristic Register
  * @dcr: Device Characteristic Register
  * @static_addr: static/I2C address
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 0b52da4f2346..4fd6a777150f 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -166,7 +166,7 @@ struct i3c_device_ibi_info {
  *		 assigned a dynamic address by the master. Will be used during
  *		 bus initialization to assign it a specific dynamic address
  *		 before starting DAA (Dynamic Address Assignment)
- * @pid: I3C Provisional ID exposed by the device. This is a unique identifier
+ * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
  *	 that may be used to attach boardinfo to i3c_dev_desc when the device
  *	 does not have a static address
  * @of_node: optional DT node in case the device has been described in the DT
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

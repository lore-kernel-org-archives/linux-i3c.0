Return-Path: <SRS0=pX9d=GY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61C7C433E0
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE3E22B51
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Jan 2021 10:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE3E22B51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C+K9UQcWWUX/8G8ZEBUHbux3O9wNFhL7OFXZoaFcv20=; b=aHkOytlg+LBpen1RwTXR9LkaiT
	+JMrc7pHm595h0mVeWUKx/68r4Pa+wxJNMeuyQG7xjZnAc2qZbhoc79sB8mYlhemgUzzzE/LdkdMr
	y3LOtNO76xkXY/jrY+1HDhR+TYIReWhlGeXDo5fXvyciYJE8WRr+nSgMJIa8W69Y04EJk11nxdldy
	UIU6QxqVQKB/K2K20j0Y9e75IksMArc6FIAUGNXur/IYSRvUMy1NujSSJygMECENHwVJ+aQn6wHiA
	i8rt8dqbKwQiRDnyprSpw/nruNZt5439xgLOTDEOYQ+kHmH/B5mQTp3TpKNnaBSNt8F1vivdEFcJu
	R9ajrU1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2X2f-0002si-R6; Thu, 21 Jan 2021 10:18:17 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2X2d-0002rQ-HY
 for linux-i3c@lists.infradead.org; Thu, 21 Jan 2021 10:18:16 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8AF3020009;
 Thu, 21 Jan 2021 10:18:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 0/6] Silvaco I3C master driver
Date: Thu, 21 Jan 2021 11:18:02 +0100
Message-Id: <20210121101808.14654-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_051815_675346_BDE210E0 
X-CRM114-Status: GOOD (  14.55  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Conor Culhane <conor.culhane@silvaco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nicolas Pitre <nico@fluxnic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello,

Here is the addition of a driver for the Silvaco I3C master IP.

Changes in v5:
* Added Rob's R-by when relevant.
* Fixed the robots warnings by pushing a little bit forward the changes in the
  mipi-hci binding file.
* Fixed the I3C master node name regex.
* Removed the redundant $ref: entries when the hz suffix is used.
* Simplified a little bit the regexes defining the child nodes.
* Updated the reg propertie description to better describe each entry.

Changes in v4:
* Converted the I3C binding file to yaml schema (including a license
  change, as requested by checkpatch.pl)
* Included this schema to the MIPI HCI binding file.
* Updated the Silvaco binding following Rob's review.
* No changes in the driver at all.

Changes in v3:
* Fix the MAINTAINERS file.
* Fix the bindings (clocks description, size-cells, etc)
* Add Rob's Ack on one patch.
* Dropped unnecessary locks.
* Used a hardware feature to automatically NACK IBI's during regular
  data transfers.
* Stopped flushing FIFOs (not needed).
* Entirely reworked the IBI handling logic.
* Dropped the warning when a device does not advertise it's dynamic
  address during an IBI.
* Moved the IBI logic into the master's workqueue instead of a
  threaded handler.
* Added a svc_i3c_master_readb() helper.
* Used consistent bit definitions (BIT() vs. FIELD_GET()).

Changes in v2:
* Change the manufacturer name from svc to silvaco.

Miquel Raynal (6):
  dt-bindings: i3c: Convert the bus description to yaml
  dt-bindings: i3c: mipi-hci: Include the bus binding
  dt-bindings: Add vendor prefix for Silvaco
  dt-bindings: i3c: Describe Silvaco master binding
  i3c: master: svc: Add Silvaco I3C master driver
  MAINTAINERS: Add Silvaco I3C master

 Documentation/devicetree/bindings/i3c/i3c.txt |  140 --
 .../devicetree/bindings/i3c/i3c.yaml          |  179 ++
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml |    9 +-
 .../bindings/i3c/silvaco,i3c-master.yaml      |   60 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |    8 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/svc-i3c-master.c           | 1478 +++++++++++++++++
 9 files changed, 1743 insertions(+), 142 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/i3c.yaml
 create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
 create mode 100644 drivers/i3c/master/svc-i3c-master.c

-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

Return-Path: <SRS0=GllZ=GA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B32C433E0
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Dec 2020 16:11:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0A9207C9
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Dec 2020 16:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0A9207C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MGkhsKlsMFZ/2pjVVKWDLiJKtrlXL7r/leQS4p+/fbg=; b=h+NfbZrapqIV05nqQRl2FWNYer
	koq0a8N2rnuaf30XHzdHN7hPtgLITYhmyPReetkH5Junb15+BtcaGYPTcMpZ9qtOS0zv1pJ0jfC+i
	HXx0/OCcqXCggUy0y2xAD+F6MbuIhPgnoLYl6e6YMeigmiovk5JWw0SiLyjNGbNdy+8x32TcvoVDF
	0r62GaJQBryQ4i7uAbjvOojztaFpjF/PXbfKKt3RTqcmuCjb4lo4kMll091+9Id4O6hF8gb1EW+aN
	QB+VQ7fL8DIFhJNJ9/LqSmoaobrYCDbNJo4p65Sa4C8g6PO9SCvtENDTfRJZHv8Tk4lgCs21IbygJ
	wjTKseDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktv78-0002jM-Cg; Mon, 28 Dec 2020 16:11:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktv75-0002i7-Pf
 for linux-i3c@lists.infradead.org; Mon, 28 Dec 2020 16:11:16 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 11113240004;
 Mon, 28 Dec 2020 16:11:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org
Subject: [PATCH v3 0/4] Silvaco I3C master driver
Date: Mon, 28 Dec 2020 17:11:03 +0100
Message-Id: <20201228161107.11804-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_111116_012912_CD5D6F92 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: devicetree@vger.kernel.org,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello,

Here is the addition of a driver for the Silvaco I3C master IP.

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

Miquel Raynal (4):
  dt-bindings: Add vendor prefix for Silvaco
  dt-bindings: i3c: Describe Silvaco master binding
  i3c: master: svc: Add Silvaco I3C master driver
  MAINTAINERS: Add Silvaco I3C master

 .../bindings/i3c/silvaco,i3c-master.yaml      |   63 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |    8 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/svc-i3c-master.c           | 1478 +++++++++++++++++
 6 files changed, 1560 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
 create mode 100644 drivers/i3c/master/svc-i3c-master.c

-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

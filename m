Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1B60A381D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wA3LZ+v5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p08LIQJAX+IGh/Cq2TKKnFdIJ4NlopiKJ6aXKRba5o4=; b=wA3LZ+v59+F8vHXd/PXYjZKIJq
	md7qZY0erLGKBL38TOXAoXsaMoH82dkemW+wsE3kHHgE17BmtkW82M1OTDwX6cNNzaaLkXaGIel+v
	LSg2HiIYwQcnIlAgjn6uhWR3mOaQrwyNcVR+Gju/kWlBSZYQPoi8f2qmy2uv3Li80P4kwsSVqfYId
	ME+XofqHVZRFC5prMKHrCz8X/71oNiGa0PglnpMO24ksM6ixk/sqHZxRnLgoCIaBFim1ZJhHbomtj
	rXZBf/ikeXb3K0Q06bo2o/zYG6VFiQfGzk72LREG4qxClzqFZpmy25kkYBej+pPEreQhUn0fNe80H
	JQgZL4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypL-00000005WHI-0FaV;
	Wed, 11 Nov 2026 03:16:47 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypG-00000005WER-1JSM;
	Wed, 11 Nov 2026 03:16:45 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/9] i3c: mipi-i3c-hci: Add Aspeed AST2700 support
Date: Wed, 11 Nov 2026 11:16:28 +0800
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAze82oC/22NMQ7CMAxFr1J5xsgJVaMwcQ/UIXUM8UCLkqoCV
 b07oayM70n//RWKZJUC52aFLIsWncYK9tAApzDeBTVWBku2I2daHFrUE2NixVBm64hwCNHZTiw
 xGajDZ5abvvbota+ctMxTfu8fi/naX86T+ZdbDBIa78mL4yE6uYTyFImzcDry9IB+27YPvnXzF
 bkAAAA=
X-Change-ID: 20260714-b4-i3c-hci-ast2700-bad726e20c01
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=6016;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=k/05GBdEuOCHYT2tE6tl/pfCWjwczfKbQjqgNVW4GHY=;
 b=3sBYcFGi4TNh39OLSvoEkqO8purEYuhlzRuSJSSH0plJkPMGiyJrK0bWb3CdnMqmARjxwp4Xy
 2mjQX9RMXGTCVQvbKwYr4+TVl4KEQJSzYkU5ve58Pr8sr3O4Q+rBIYF
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_191642_368822_72DC9F67 
X-CRM114-Status: GOOD (  16.62  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Aspeed AST2700 SoC integrates an I3C host controller based on the
MIPI I3C HCI v1.1 programming model, extended with an in-house control
block and a PHY programming window. Both extra register regions are
advertised through a standard HCI vendor extended capability. This
series teaches the existing mipi-i3c-hci driver to drive the AST2700
controller without forking the driver.

AST2700 specifics are expressed entirely as quirks in the match data:
the existing HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET, then four generic
quirks:

 - HCI_QUIRK_DAT_INDEX_IS_ADDR for address-indexed DAT slots,
 - HCI_QUIRK_DMA_64BIT to configure a 64-bit DMA mask,
 - HCI_QUIRK_TX_START_THLD to clear the TX start threshold in DMA mode, and
 - HCI_QUIRK_BOARD_PHY_TIMINGS to apply board-specific PHY timing from DT

plus six quirks for everything that depends on the ASPEED vendor
capability:

 - HCI_QUIRK_VENDOR_BUS_SETUP to bring up the bus
 - HCI_QUIRK_VENDOR_INTR_SUMMARY for ASPEED's interrupt roll-up
 - HCI_QUIRK_VENDOR_RESOURCES for further clocks and resets
 - HCI_QUIRK_VENDOR_DAA_INDEX for access to DAA index registers
 - HCI_QUIRK_IBI_PAYLOAD_THLD to bound IBI transfers at the controller
 - HCI_QUIRK_VENDOR_TX_AVAIL for precise ringbuffer operations

Generic MIPI I3C HCI controllers are unaffected.

The series is organised as follows:

 - Patch 1 defines timing properties for the devicetree to manage the
   impact of board design on bus operation.

 - Patch 2 documents the AST2700 devicetree binding.

 - Patches 3-5 add the generic HCI quirks AST2700 needs --
   address-indexed DAT slots, 64-bit DMA addressing, and clearing the
   TX start threshold in DMA mode -- with no AST2700-specific code yet;
   nothing sets these quirks until patch 6.

 - Patch 6 adds support for the AST2700 I3C controller by implementing
   the controller-specific quirks and enabling all necessary quirks in
   the MIPI HCI driver to drive the AST2700 controller. It recognizes
   the ASPEED vendor extended capability, brings the controller up for
   transfers (master mode, PHY timing, reset/clock resources, the
   interrupt summary path, master clock stall), and enables all eleven
   quirks for the "aspeed,ast2700-i3c-hci" compatible.

 - Patch 7 adds the IBI termination threshold, a safeguard against a
   misbehaving device that never terminates a payload IBI on its own.

 - Patches 8-9 tune bus behaviour: PIO TX queue utilization, and the
   PHY's built-in pull-ups for boards without external resistors.

Tested on an AST2700 EVB: the controller probes in both DMA and PIO modes,
completes DAA, and runs CCC, IBI, and private transfers in DMA mode.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Rebase onto the latest i3c/next
- New patch: move the AST2700 timing properties into the generic
  i3c.yaml binding, renamed to match its existing i3c-prefixed naming
  convention
- Remove is_aspeed(), replace it with seven discrete quirk bits
- Rename vendor_aspeed.{c,h} to aspeed.{c,h}; keep struct
  aspeed_i3c_vendor_data private to aspeed.c
- Add a probe-time check for the ASPEED vendor capability being
  missing, ahead of the first vendor register access
- Drop the NULL check in hci_extcap_vendor_ASPEED(); vendor_data is
  always allocated by the time it runs
- Fix aspeed_i3c_set_daa_index() to clear all four DAA index register
  banks, not just the one it is about to set
- Drop the dma_set_mask_and_coherent() return value check; it cannot
  fail for a 64-bit mask
- Revert the pio.h register split; add an accessor function instead
- Drop the unused HCI_DAT_ANY_ADDRESS macro
- Make the Open Drain PHY timing pair all-or-nothing, matching the
  Push-Pull pair
- Acquire the vendor clock as mandatory, matching the binding's
  required clocks
- Acquire the dma reset with
  devm_reset_control_get_optional_shared_deasserted(), instead of a
  manual deassert and cleanup action
- Pulse the core reset at probe instead of only deasserting it, and
  reassert it on driver detach.
- Limit the SDA hold time override (i3c-pp-sda-hold-ns) to Push-Pull
  timing; Open Drain always uses its hardware default
- Link to v1: https://lore.kernel.org/r/20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com

---
Billy Tsai (9):
      dt-bindings: i3c: Document generic bus timing properties
      dt-bindings: i3c: Document the AST2700 I3C controller
      i3c: mipi-i3c-hci: Support address-indexed DAT slots
      i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA addressing
      i3c: mipi-i3c-hci: Add a quirk to clear the TX start threshold
      i3c: mipi-i3c-hci: Add support for the AST2700 I3C controller
      i3c: mipi-i3c-hci: Program AST2700 IBI termination threshold
      i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue utilization
      i3c: mipi-i3c-hci: Support the AST2700 internal pull-ups

 .../bindings/i3c/aspeed,ast2700-i3c-hci.yaml       |  89 ++++
 Documentation/devicetree/bindings/i3c/i3c.yaml     |  86 ++++
 drivers/i3c/master/mipi-i3c-hci/Makefile           |   2 +-
 drivers/i3c/master/mipi-i3c-hci/aspeed.c           | 500 +++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/aspeed.h           | 177 ++++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  38 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 195 +++++++-
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   6 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  63 ++-
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |   2 +
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 +
 drivers/i3c/master/mipi-i3c-hci/hci.h              |  11 +
 drivers/i3c/master/mipi-i3c-hci/pio.c              |  32 +-
 13 files changed, 1153 insertions(+), 49 deletions(-)
---
base-commit: c899ff589ac6922c7ff72badd8f0664b974bc850
change-id: 20260714-b4-i3c-hci-ast2700-bad726e20c01

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

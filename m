Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0652DF01807
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gNbqv16187/NCFZxAXVR6f1iPMcOJ4934NmDwSRAcw=; b=eYHoNoBiXvP/02
	a2nf3v1reLZf7I0miB/G1iafRH+lpUbCBYZQAAtq5/R4khkW38D0lJJsP2Rz7Od5eXlBWIYCUABma
	TcM2VPIg96S9Gylv6dpiKQTA4lHiDadJ130vx3j2hH5jvGowQ1VGxc0BpqI52hZyHH4tr3HJBPVP2
	B6xM8oWBECyMrr05h7R/Bc3e7pUkeQgzr9j5Ij+NtHbKjSKtDB+GAVxsEUGNlL8uQzTwqcW1gRnSi
	t16PL6tfpoCJjrqpt5jlK7JmzAlteDavWjYYOWCzhHO3IBg+vahAx5efradpTzRZU+Jkkw90/aJNi
	f7KkfuGplF7vYy2B/GvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYb-0000000394y-2Y09;
	Fri, 06 Mar 2026 07:25:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYZ-0000000393X-0GON
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781907; x=1804317907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zVeEO6IhVVfaqU5jr//AIo4mNHuhRQ7kQ37hpy0O6B4=;
  b=e3elZyowtoF4uWNiudYnVImYJJS8XvrKMhzOaBZsF5nk7DVCQJ2YxCCE
   yQSpqucEEPEls69xLqQZvEqs2kqNl1cgR2IY9CHfNK7DvB8iu19ECLT6g
   gG2aHVePuRcV2HzTl5vizY/Bo4ifBxA6zy+NTrJwSQe7y43E3FhbiRvAY
   mhmcDhgHGkdTPQaAZnQN6IPHE+kjCujjMfU7jKWEikOieximpZPRgC1Sx
   ae4PT6hEe3tOOwaUl2AnRvmBk7GflN0WfJlX8Skv4cnRbMZKvxI8vB8XG
   oWtyJvygingA/WIZ4nB/wSBchxnQisQHJObmTLk46N3xMtD1LX9ZvjSbK
   g==;
X-CSE-ConnectionGUID: Mq5aYYR/THuUz5y/SY21Mw==
X-CSE-MsgGUID: ddZ6p62hTO2AFxQIlYFkMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461315"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:06 -0800
X-CSE-ConnectionGUID: IANV8CVUSn6V0fYjOLQMDA==
X-CSE-MsgGUID: Xm+eILCLS+GvWExyKJyGNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419880"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:04 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 02/14] i3c: mipi-i3c-hci: Fix Hot-Join NACK
Date: Fri,  6 Mar 2026 09:24:39 +0200
Message-ID: <20260306072451.11131-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232507_119978_D7A94839 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

The MIPI I3C HCI host controller driver does not implement Hot-Join
handling, yet Hot-Join response control defaults to allowing devices to
Hot-Join the bus.  Configure HC_CONTROL_HOT_JOIN_CTRL to NACK all Hot-Join
attempts.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dbe93df0c70e..4877a321edf9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -152,7 +152,8 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
 		amd_set_resp_buf_thld(hci);
 
-	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	/* Enable bus with Hot-Join disabled */
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
 
 	return 0;
@@ -764,7 +765,8 @@ static int i3c_hci_runtime_resume(struct device *dev)
 
 	hci->io->resume(hci);
 
-	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	/* Enable bus with Hot-Join disabled */
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

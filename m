Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF447D26284
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jan 2026 18:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ri9a4JLlJC6lobu+dA1bz3N0yX/XQGTHGBNwvNvzzvE=; b=bw4f0+mGE1Uisz
	3xSy0FS1IGDu8UFGH8c/10mVaYlgXck/yDEPgDdPTSUOsQDJPQdEBJfcY8+28QsyNsLUCuXgRe5ST
	lDiNgcHmoJkBid7n1pBty3CsisF0O79VmnD0ZH+Q8ZggvohuqTyd2YAqV3+ryenozhRBcah46OF/Q
	4v8inhXN4sRLphtY5u6OTWpTOSdX/4sLBwaKkMueqCSbg5s3jGrTOpy4Kc7Lpzzvc2926Skb8UJZs
	diTtyZWrVxrnJPIGAXgMETFpXxJNG6sv0fDpXaF/TdrKfOQ5OYIZKkAHle7DrgcRemrPmz9CUQXN/
	r79i0v+FgzOdWqKC1JfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGbv-00000004JO1-2HJ8;
	Tue, 20 Jan 2026 18:37:51 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGbs-00000004JN3-1NpO
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jan 2026 18:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768934268; x=1800470268;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BwggnNAP+ZiJR06WysPnwfFE4Ue3RGJuwxDgbOKcdhE=;
  b=FmKWmfowjG99q/zyBBS08qPvQpESTX6HXtf4YPbUSVRtzyDgqVdA+KSU
   ZgOAjLZKnZYnEqvWnrzYb8tAVb44I3A6SRkw4ocIRGM5xS6p9WhN6Fre2
   TKmJt+t1TlzVIn+JNMLRLkz84HtCAXtib5TgE7v/8pN8F968yffgNbaT5
   QfganGIlNlPWFPPiLug4polwDI9uStUXKNEv9fj9olQVrmptScZ2uSDy+
   axYSyUT08wm9UQ232WmxGDiOM8akTNgLV7L3DY5Ibab9cCoZq5jmfBIdb
   OIIaRSdwGcalVLyqU9Mj9jiYwkQ6Gy5qQKwppNsIlKtfea+HIJy3FmCiO
   g==;
X-CSE-ConnectionGUID: 2wmtLTaZSgSE1pXEEB0U6A==
X-CSE-MsgGUID: PJDAopAQTMiNdQL2ctiK2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80874610"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80874610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:37:46 -0800
X-CSE-ConnectionGUID: hSIJqO/1RpqYYrTAZ+JMug==
X-CSE-MsgGUID: y3BFUHWXQ7SRLLpfieuI8A==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.170])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:37:44 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 0/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Tue, 20 Jan 2026 20:37:32 +0200
Message-ID: <20260120183735.60654-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_103748_377506_445CA303 
X-CRM114-Status: UNSURE (   6.55  )
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

Hi

Changes in V3:

    i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
	Rename 'restore' parameter to 'rstdaa'

    i3c: mipi-i3c-hci: Add optional System Suspend support
	Rename 'restore' parameter to 'rstdaa'
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci-pci: Add System Suspend support
	Add Frank's Rev'd-by

Changes in V2:

    i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument.
	Fix new helper function so that RSTDAA is conditional on the
	'restore' parameter.
	Subject and commit message amended accordingly.

    i3c: mipi-i3c-hci: Add optional System Suspend support
	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument.
	Commit message amended accordingly.


Here are 3 small patches to add System Suspend support to
mipi-i3c-hci and mipi-i3c-hci-pci.


Adrian Hunter (3):
      i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
      i3c: mipi-i3c-hci: Add optional System Suspend support
      i3c: mipi-i3c-hci-pci: Add System Suspend support

 drivers/i3c/master.c                               | 49 +++++++++++++++++-----
 drivers/i3c/master/mipi-i3c-hci/core.c             | 49 ++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  7 ++++
 include/linux/i3c/master.h                         |  1 +
 4 files changed, 95 insertions(+), 11 deletions(-)
 
 Regards
 Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

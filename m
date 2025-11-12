Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A762CCCF9F8
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KUg+otX6xt51M/rW4WwmLFKlIDJ8uipmqQk9mBUImLc=; b=OMCYZwVpt3XNAB
	o6mjh49L5mFw296qdesuj7y04Q+uyDFAS36VZb1506jJx8aBpsncvTNcsvU8iYODQMnPB3EdEbCQe
	t1O+aBQ9kVCiE/przyC3XoKD3IrHBug6ll0BLKxYv4KMlz2kxEYOPsj/4JEdwA82WEL6skGCf0lE3
	A2nrDHj0JXlCEtCxAAt2r6nUn3Oehxp0hW+xKrDJ6hQlLS7MxYhON5vEw7jqZVY1qHnXX4H2yxaX5
	YMqepClRCcMt9jLVUid1QtN7BXR8+T/jVjwvRuEDW3M1jfkYT8hMaK30mDzheLvpk7yh1gRhIMXny
	Rs68JgFzoDDo2mX2vStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hm-00000008WLw-1UB8;
	Wed, 12 Nov 2025 10:03:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hi-00000008WKi-4ACT
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941835; x=1794477835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Jlk4hyRJd6JBaV/jX2WC1AUL5Jy95oXEIp+S+pj/Pc=;
  b=ADGytnr31RyfOa6lY4khEtHLbgBMLOhk0C+WmQJQ7RMyP7ye5Qn8y/gj
   NquoBQH6wAwaemqnEG/pOnd+RNsHqaAyKUw8Zd00tqf1z3krClAbV2UpD
   eqmMjuprYVlaeZ2nl6fXVRF6tK43COVR0iA31VpMJdACnINb82QrYSsJi
   qvygbWRsxTS2WAOsjSC8wd122MXsji4wOoJv4wFmk6puHPlF4fLPwAxJl
   CghqaEuvqLfsImwCtLJebHGdigFXhy5xmfxK28qSkbtXJZoD5UqMyVLDg
   atp8VJSHtla9y1jvyrQ8TmHiPFrFwjRc+bmHamwLI0sm9CfajmVbfXmsT
   w==;
X-CSE-ConnectionGUID: TstmWF8nQx2KVwAffH6Tdg==
X-CSE-MsgGUID: NH59jMMEQlmpnZWKZ6RpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616200"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616200"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:53 -0800
X-CSE-ConnectionGUID: kZ7S729WQQ+zSu74SNHQNw==
X-CSE-MsgGUID: 0Bd2JVhmQgCGV4Vo8SdpHg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:51 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 00/13] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Wed, 12 Nov 2025 12:03:26 +0200
Message-ID: <20251112100339.51726-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020355_046824_11EB7423 
X-CRM114-Status: UNSURE (   5.67  )
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

Here are patches primarily to add support for Latency Tolerance Reporting
(LTR) for Intel controllers.  Most patches are small tidy-ups or
preparation for the main change.


Adrian Hunter (13):
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
      i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
      i3c: mipi-i3c-hci-pci: Constify driver data
      i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
      i3c: mipi-i3c-hci-pci: Change callback parameter
      i3c: mipi-i3c-hci-pci: Add exit callback
      i3c: mipi-i3c-hci-pci: Allocate a structure for Intel controller information
      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
      i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers

 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 236 +++++++++++++++++----
 1 file changed, 198 insertions(+), 38 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

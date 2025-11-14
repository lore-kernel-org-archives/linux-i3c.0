Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A929CE8D6F
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=72Kz0qPkh98htpq7LHrTP9ne3APJ/9U3N96KJBrWYGo=; b=jtqVA6Ou9zp3Xt
	/0kLytm9TLb6eoTcsQneeQF+gJOA6v5qM8vwxRhJHJHcvAomdJFlk9D9xVwejcPkUckVgtkH0d5Y7
	591LA4B8PykIuhPfzv7MMYRckX+5DREWFwCco/JNkQQ53WOpxFCcqwo7IReS2djBbAIKCAKOB5G4w
	155uB/mEo8c+pZ5gB6VJeyxib/1VOf+5OmDnbnlyb+utRGPD826doHIumutt9jL5xmY/UqZ50QjBh
	tYQgsiJ3/CXevWAiwlffiBzwYkVgGw4Vh6nrLLXHOPzUMJz32JidB7QdIY43sBMJJmM8Fud+tf0Au
	AsjJu0DovruJKAfsuA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJO-0000000CwNs-0QE3;
	Fri, 14 Nov 2025 18:14:18 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJJ-0000000CwLW-3KZn
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144054; x=1794680054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DpuT3rasMlx7cP9kKPF8sEquZIdGONr1K7d0ZJ/c9Fs=;
  b=g1hAnEmaCFB/gDu3waCfKp025/epUVrpqmIze/Fx/cafSbzqIvVapWum
   mupwd/gakBXjKXbkdaARapKhdCKFchNDq4m7cnyady19wI57EIia+wW1c
   GnRZw8fPO6meMDYIVnZJTFVO4jkauiTVI8cJPs/OoDw5nSl7uhfugmbBH
   mhPx72xssc1YWzfRAErbfHwX3WEwiJHBg/v2YpH6T140fbfpcypS8jFhd
   2oUfH4KI+Oki3PAa2fHZy/CJ/LaLHLHStcG8EtrF5vZvnbZQ08FuEeqvS
   Qvn3gLXIZBxTh9FLfOqKVjWSej03HZgEA10wmIGo6MRI27osXlrNO1Ei7
   g==;
X-CSE-ConnectionGUID: hnaTg7HtRSW6b2ak6AX4vg==
X-CSE-MsgGUID: 2uZyjlD+QziHUqZezcJd6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129272"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:10 -0800
X-CSE-ConnectionGUID: qKTkZLfGQRyYHr1u2k7iyg==
X-CSE-MsgGUID: kF9gluX0RgO3whqtD12FGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668953"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 00/13] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Fri, 14 Nov 2025 20:13:43 +0200
Message-ID: <20251114181356.66515-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101413_907386_602B88C9 
X-CRM114-Status: UNSURE (   7.81  )
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

Here are V2 patches primarily to add support for Latency Tolerance
Reporting (LTR) for Intel controllers.  Most patches are small tidy-ups or
preparation for the main change.


Changes in V2:
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
	No need to check error from dma_set_mask_and_coherent() with a
	64-bit mask

      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
	Rename 'intel_init' to 'intel_i3c_init'
	More explanation in commit message

      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
	Change 10000 to (10 * USEC_PER_MSEC)

      i3c: mipi-i3c-hci-pci: Constify driver data
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
	Move location of intel_reset() to get a prettier diff

      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Make use of FIELD_PREP()
	Improve handling of values that exceed the maximum

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

 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 238 +++++++++++++++++----
 1 file changed, 200 insertions(+), 38 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7350CD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rVwewpbP25Hxp6Iap2Hfe6NpYhFeYWtSUEi0s7fLjsg=; b=zkZRnvqt+u0jmo
	sz0fu3Fhbsn3BBON9XGSSgbATTLCoybDIu0fJYv8gfaOfUO/5JXSg92isIxyVOEo95tPPSVzHIjLO
	nEbOFAxCLQbYYzcId6lFUxoFLeOga4YiEz/KV103ZoljTkcksI0nKJ/s8goLCKfYhc09wDTRb8eVl
	W+vvnSr/KmtdPVITrLIcQ1ThZROSAmG73gP+wjDJsYRyrLBLeT3jmD4MgQxaofEEAcalbVdaz0a5o
	+uCImas75514LVnUDELXYdBGGGEI2v+nWz3H2aMzsRmLAf+YQhUcXGUoPR4YtCUgPF1vGtWYGhI+d
	xtn5W82gSSnrxxgKW6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7M-0000000FgSK-1Ksg;
	Tue, 16 Jun 2026 11:38:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7J-0000000FgRG-0PY4
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 11:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781609885; x=1813145885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0rsahb4JYi9TsDtVQhPDU/NUBtnGiPBxYpyYhHhY9bY=;
  b=nHOlAa2cwdZ2FR3faEYQy8L5Q0Z9DfxInoFYwz6KeBK5qQuZPQlaXxmR
   SvKyA6B094Hia97z/tyB06tM3gxYwBMv1MqPYa2AqCEGzxd58Yzt8x6pH
   S6CZ4ClkYkvZci0nRfbjqBVjBWWJ33UiKudefIHe1D5sjLkh56EDFQza8
   BTYu+lQoQAtVki+U+Gi635MDWRyUV7pXzjiSTe6pLcQzW5gZzjAOQhq0W
   MtFdOwOB6LoFJtE+Z3nBV4yWbQQr9jyoR+ldcWRMmcLNmJi0uuRU5+gj6
   f2tTEdgTiO915w9Z4zgAqpJBI3myV3dbGTdBIvJ0Q0RDXsWGvmbZxMSdU
   Q==;
X-CSE-ConnectionGUID: x2621R5ATQOQW/t6bQK9/g==
X-CSE-MsgGUID: ZyFgVpzNQcO1QLfXAtYpXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82383802"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82383802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:03 -0700
X-CSE-ConnectionGUID: 28Pk4EHLSv663pCbJ0IadQ==
X-CSE-MsgGUID: 1kaptDURQIyg4UK5NKf0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="251666722"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.134])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:01 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] i3c: master: Small fixes for dev_nack_retry_count
Date: Tue, 16 Jun 2026 14:37:49 +0300
Message-ID: <20260616113752.196140-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_043805_284011_DC444033 
X-CRM114-Status: UNSURE (   5.40  )
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

Here are some small fixes for dev_nack_retry_count.


Adrian Hunter (3):
      i3c: master: Update dev_nack_retry_count under maintenance lock
      i3c: master: Add missing runtime PM get in dev_nack_retry_count_store()
      i3c: master: Use unsigned int for dev_nack_retry_count consistently

 drivers/i3c/master.c               | 26 ++++++++++++++++++--------
 drivers/i3c/master/dw-i3c-master.c |  4 ++--
 include/linux/i3c/master.h         |  2 +-
 3 files changed, 21 insertions(+), 11 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

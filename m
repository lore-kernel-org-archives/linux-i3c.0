Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC4C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q84hQp3ORTYnKgjByA6yIOhjw68Iaa3q7jFcuaoc2Vk=; b=lIzUzw/MoZJNWC
	ytf9FTYY1e3HrlIlRhFfmKg4Q5mNnvkuoWo5N3Zb01mVXpDYfDxEq/ckYLYAeux7CEm2sclPaTbEq
	bEMO/w5TnCLkioBaAnbcV59FuC1jwtZsBBEiW7ByWHNbm3RPEA81ZPiTvBnV2OzsfiChiD1nQraXW
	DQnt2ffyMy3KFKlcip5Tr6xTG2erzx6e6/QtK/TG7G7Fk117Z4Vn2/yYB9n39JG/BopFicwkMxKKL
	eIqDG/B5bQHPGop0ANjy5sUpm1ad1acWRFBSXAFqGbwQMNToxnwsVefqjdFkuijAFxQgTGkEBt5UT
	jY96ZmPyIulR3K4vbdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj24-00000001G2l-3gyC;
	Thu, 09 Jul 2026 07:18:52 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj22-00000001G1t-0nM7
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 07:18:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1041378a91.3
        for <linux-i3c@lists.infradead.org>; Thu, 09 Jul 2026 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581529; x=1784186329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8LFeUdtYiBGtbH9s+l8HDLcIeQe+484GJ4DwfN1XXM=;
        b=IspWEBk6F6834YU+9V6r9aJe4ttyJyPW2J/qeNA1AIrLsD8oFy0f4YEUsVm8227LtU
         tT1koAs12jTR1Wkdyqeuo5sYJwgEK1MM7hNEnsdvl+SqgFeyr/PvG0rgCQYh3joppe/Y
         Yt4ZhhFN+0H2vQt0SSciZLMcm8lasj0Wc1V001WWm0crmHntGLOHURsq/A2dgLvIfhkT
         XrUHuKawrBonf+zkmFddTNuhPMpyG1AGVDBWSeFMLyHswDIZYByHQh/0h3vA7/02Cc8W
         XeY5eGyTVryPtoX95cQRah2Sfnig/1m+zwp5PpOcFeYdEa7n6H+XLcmrAHFrqG//imoe
         ol5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581529; x=1784186329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8LFeUdtYiBGtbH9s+l8HDLcIeQe+484GJ4DwfN1XXM=;
        b=qroim8EMJB46glATZiMJkjkewSxZyUJ3dvHDSahYIMX6xbw4tR3y152XxyEBfYI4WS
         97Gq5EXu4yv0SsChxXZ9U09IIbgmpY2gDUjhNLKQYI+STUBNuSuTwvLPxJ3z+8gPTXCS
         VmKDm4OyDga/fGrXpDjwk27/ZpnEC1kdASsPuqrF9ZUBpFdERAmidzTjVlQuzS0V2xss
         kpBk+xWVbubPKeS9oH8dIb29XIV4RYsTWW8+Wau1CmxWTdyMcwUuk4bz5xFVjf1h+R7U
         acfFLzTnPk1K0AIoxmV4EnhOrwcGD0HCnupq8LXOjzefpAIT486VrjSL7ef1/waSQorM
         rpDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUHRjTdacWNHeg7vwUKToxq65mfgsvNSlWh4rpSzfWbYGGersOXrq80cqVxnrCqaJw/FcaoFVfHJo=@lists.infradead.org
X-Gm-Message-State: AOJu0YycXTD7pmB9Vl0X6RPvVeJ6/dYpdHXYJbk2s/el21bBsLjh7ntW
	lfQohk17o+wOxGMM0gkm6NXrcPixKUgXvJ57Sjedc9izQNTDnpMaFCTg
X-Gm-Gg: AfdE7ckttfCNEzHpIDaGWLk9Dk1cLXD5qJS2n8MFHCj0WA/vbdz+D1WDAytPulKnup2
	4LDMcsLc8el8bvx7usv9rGqIhjGR276FRhjI8Ypm8G6uKEtJDDoxL7VfOuWIsgEk0cfJ/pHPyG3
	I3jFRCy+BxJKRdW7E7FqukJUeNhBDUxMYSEozr39SvHYXy3LCCq8d9vnqgex6COXyDgfNRIpZ84
	ri++dyDJ09Ur4cjqZgculqH7EltKHD3+z8HSpSooPaNvgKb0zsgSb6kjqaV6Fmvcpl79IKEC9D4
	J7cjUY1GFJbUWeVOA51RecWj1EVa8ZiCqdfccI3fCSq2h1+k7DmPEsOhoJUwyevhivvEOe7pFWV
	q0f1/jm93z8XwtY4NeEcvXwespBjmszTgUTYzbUjfS9s2yq4+2YKva44Ax850WYPnFzbti9wfGc
	Q4/KOBZU6HSM2WTz1vgmHFU1taGrg/Am8AHcQeY8xSPDAFey1DtneSKbzrCKlh+PiiKHHmWsXQB
	Ydst0anzLY+KXcOGlCaw6mEb2O88jYG3wh17ONO+kpzycR/DteZGWv7
X-Received: by 2002:a17:90b:52cf:b0:37d:ac3a:2f4f with SMTP id 98e67ed59e1d1-3893fe5d5e0mr8010739a91.13.1783581529075;
        Thu, 09 Jul 2026 00:18:49 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e11d-51b8-fc5d-5f39-cd11-ce64.emome-ip6.hinet.net. [2001:b400:e11d:51b8:fc5d:5f39:cd11:ce64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm697456a91.1.2026.07.09.00.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:18:48 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: [PATCH 0/3] i3c: mipi-i3c-hci: Add support for AMD_PT and improve IBI/PIO robustness
Date: Thu,  9 Jul 2026 15:17:41 +0800
Message-ID: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001850_229649_CFAC7AE6 
X-CRM114-Status: UNSURE (   8.12  )
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

This patch series introduces support for the AMD_PT I3C controller and
includes several improvements to the MIPI I3C HCI driver to enhance
stability and compliance with the latest specifications.

Summary of changes:
- Patch 1: Enables IBI threshold interrupts by default in PIO mode to
  better handle Hot-Join requests and early IBIs.
- Patch 2: Adds explicit PIO queue management (enablement, starting, and
  stop/restart logic) for compliance with HCI v1.2.
- Patch 3: Adds the device ID and platform support for the AMD_PT I3C
  controller.

Testing:
These changes have been validated on the Intel Panther Lake (PTL) and
AMD_PT platforms. No regressions were observed for existing controllers.

Jian-Ming Liao (3):
  i3c: mipi-i3c-hci: Enable IBI threshold interrupt by default in PIO
    mode
  i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
  i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller

 drivers/i3c/master/mipi-i3c-hci/core.c        |  4 +
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  9 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c         | 81 ++++++++++++++++---
 3 files changed, 82 insertions(+), 12 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

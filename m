Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B3C19F32
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Mar 2025 04:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=edYD0QA49Agk2+OmSzwI4p+ZOyv8rrKHcY0sDkLBhA8=; b=4y3t0mNGV6X9Gu
	cWZnpwyt48Qi9iB4aU3yu4DYg3cm4DXencDZy0NBApNSzXysyZM6Wt51FQyWX7wS0EO43/P5Qy1En
	R+zSJhYLOpb8ROUcQirMKkafTYYMBx3Y77frh91/YVbH3XAIS2mCpOi+MDq9517OoY2V1l9r2Z0Kv
	y7I4TJyoMAFJBeLyrE/Cuv10UuPV6OAcWjKsDJLbNu+QQM2jJ/rtZ3+6swIX6gUBtMOlIVQZGP8NY
	+jVvtWnfjmSy4vIIimjul5AKMdiOnZHzbBrheVzGx30RXJGzuKMW91K8zhXTaAq1bv2WHcNDhyNBp
	owukNFav9Tv2P9dmbZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgcm-00000006yjB-0OOj;
	Wed, 05 Mar 2025 04:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfga-00000006tym-1XU2
	for linux-i3c@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C+mPOlRZ4KjStxcBL3Z6AAydz8YkO5iSHIPj72E4lQE=; b=iz4qdI7CsJ3ltfjVysFtOiHYYv
	H5l+g9L5n1o2Si4sTAjcYi/YyQV18raTYm5uG718FdKpyZkbODHAUBECXjld8+CR/+IZ6WdrEu3z/
	LFIRUDAl8oBBj/zPC3C0C7rUcKHMZf1Hbe8TOqS0weGPHZZAWWqv2Jvk+ciAwESBW/pJrPgV0ONHe
	7U2C6K9zY5bQ+hHSU/BWA0G+i1EkfSuRBM0b0XR0kTQ7QqOxXd8/1JDdkuEe4cdAqHwp9LwWUCWr9
	WngsGzrtBQ7P379XDGnIZhOz4Vn/UgQ01qSFj7W4657lbkG+o467SSrOj087IUatAgwywwoH34Hc2
	fAZa9lgQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgW-00000000LUf-45xJ
	for linux-i3c@lists.infradead.org;
	Wed, 05 Mar 2025 03:44:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223a7065ff8so78873525ad.0
        for <linux-i3c@lists.infradead.org>; Tue, 04 Mar 2025 19:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741146277; x=1741751077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C+mPOlRZ4KjStxcBL3Z6AAydz8YkO5iSHIPj72E4lQE=;
        b=PA2/kctCC8aLRpSVJdqbMZB1dVCUcFgSzxgQLleKP36r6VjeY2WmNUh5XVLNu5W9En
         NB2b/hRkg4u9xD39+K3Nr3qTEXb3ThN21lJHhszKvmN/rsgCgmUK5Cs4YOYV6jE55mYF
         HJElE8yDwDP4YDSIJ0IYuGY3sSwuhq3fZ19r85emoQBRD2Sk9q0N0ueSARa5o5NTwAJl
         X6iy2QJto8o3L+t/4JxYMihFj7LyogPE34zk37A/wKn+jiThjmdaSd0wN/De+GjPiVje
         JKhsALsS/IrfgN8MXJSbo5fi0tlGlIdOXmHBHBFQIy0QrBS8tDpyMzJWFWJpoIzealDY
         OtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146277; x=1741751077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+mPOlRZ4KjStxcBL3Z6AAydz8YkO5iSHIPj72E4lQE=;
        b=By9w8mlen58eatlbRXhFINDg5cyYSOF1+LcdMCnYIu16/S0EtRqDELrJC+iQOgavQ8
         NDTMjZvBc4prCqs+zn4EWbPhRFyooIuHJ+GDVJGCl2D5TTAJ809IzrNOQsXX0HnRdIWR
         IKu4Fsr4RdvqtphXZeThby7GHvq3gTrXoU3MYlVzcE9J8lSw0hi1HEdxVyXFQIQMmF7o
         +r3McnwO+b7NcmYo/fEIf/GGz/cVX7JWoWm/7WseUM7N3RjxddQjSqD9XN2PoLOlzUEI
         iRIsDW837C9fMrhryzzXk5OL3QYb1iy0Ecy0f0CXUCVN541xsL9EuRY36t1LBSkcj0hw
         ktFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV96wp7oVzC6SgyY7KskHdAhePt9EuJ8AHuVEmT9yTPUg9GaO5utrkSfzu+e5BD00OMtIJUn372Z4I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3u+kre+VfzMKMYPu530RgYgN2dSPAJx07MZziGhkEQOBYvlwZ
	bjIv468wM3QeBzyVmkCB++vcAJHzIoPnI8aVvpJPSmx7YWLBaH5Z
X-Gm-Gg: ASbGncsnqtycI53jRYxXHBzhWxNjbwe49QnjoWC+YBrfN0Of7rhzTl4TaJqqTlZpPPh
	0jHr756tlsxzmpN1jzQlrtYnRXJymxoT7TZtcg/lEtIqwk3bXeArZYpiH4zLCFX1G8QNZa9a90r
	hoxzXJPN0P6ma2/iTt5/zA6L+Lok/LJfPD80WdPSh+waNbSHwhvpJ3H0PR1p1JT5xxskUFx8faa
	ABgVP5WOzGaLFWUSdB2B6q7/M+mwfaQLMBT8fdGRzdpkZSv729Mf4pqi/kq8DaUeq/XrUW1vS+L
	vl8Bv3W3vQ4v+67n2D57oh0OO6wQ+vhfbiXs9kgY+ury3gTIDe2hkVg=
X-Google-Smtp-Source: AGHT+IEl3ybxCxPWvhfjzdCxrRkFkwGL9AXhPPB0O84T8rMHBFkItUCVeOf84SGTH/VV798lvDQFkA==
X-Received: by 2002:a17:902:c949:b0:223:517a:d2e2 with SMTP id d9443c01a7336-223f1d548b2mr26251405ad.53.1741146277279;
        Tue, 04 Mar 2025 19:44:37 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c37sm102734335ad.133.2025.03.04.19.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 19:44:36 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v6 0/5] Add support for Nuvoton npcm845 i3c controller
Date: Wed,  5 Mar 2025 11:44:09 +0800
Message-Id: <20250305034414.2246870-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_034441_144848_A7B05298 
X-CRM114-Status: GOOD (  11.57  )
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

This patchset adds support for the Nuvoton npcm845
Board Management controller (BMC) SoC family.

The Nuvoton npcm845 uses the same Silvico IP but an older version.
This patchset adds fixes for the npcm845 specific hardware issues.

--
v6:
 - Define QUIRK when it is really used in the separate patches.

v5:
 - Add default driver data
 - Add helper function svc_has_daa_corrupt()
 - Revise SVC_I3C_QUIRK_FIFO_EMPTY fix and add comments

v4:
 - Fix kernel test robot build warning.
 - Add SVC_I3C_QUIRK_DAA_CORRUPT fix

v3:
 - Add more description in dt-binging commit message
 - Add the svc_i3c_drvdata structure in struct svc_i3c_master
 - Improve the do_daa

v2:
 - Add a new compatible string in dt-binding doc.
 - Add driver data for npcm845 to address the quirks.
 - Modify svc_i3c_master_write to be reused by SVC_I3C_QUIRK_FIFO_EMPTY fix
 - Fix typo of SVC_I3C_QUIRK_FALSE_SLVSTART fix.
 - Remove the code changes in svc_i3c_master_do_daa_locked, will add it in
   another patch series for common improvement.
---

Stanley Chu (5):
  dt-bindings: i3c: silvaco: Add npcm845 compatible string
  i3c: master: svc: Add support for Nuvoton npcm845 i3c
  i3c: master: svc: Fix npcm845 FIFO empty issue
  i3c: master: svc: Fix npcm845 invalid slvstart event
  i3c: master: svc: Fix npcm845 DAA process corruption

 .../bindings/i3c/silvaco,i3c-master.yaml      |   4 +-
 drivers/i3c/master/svc-i3c-master.c           | 127 ++++++++++++++++--
 2 files changed, 120 insertions(+), 11 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

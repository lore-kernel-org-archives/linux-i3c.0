Return-Path: <SRS0=Yvk/=HH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89789C433DB
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 23:44:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C034964FFF
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 23:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C034964FFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PBwlWIUrevL6CgqfMWXHMoQioVY6YfvoSmalt74IzP0=; b=efduky/z3ub8u3a2mVMiJ6WzC
	tNY7DheJLkumZ3kQGWeMnajI+nRqBgFTKNMbIUxyINS2WNIFD9lqiOlZr+2Ww0ZmGxb4dvf8i/K40
	tllzf+9UaLsP+F+EvsGYcGBodPDJjoKOmxD/7uxSmuk272T26+4WmhZemhrLoaGEKgLX82SHxEaah
	6w+ABhXbyafUoaA9bpgF1XbRtnykYXXmKO+Pw4tF9lPzRWT8l/KZqA5Iz/yR5dQpI4GBd7m7Or5kz
	PY06YhpJfM/a1gokOnlYC1Zt3wZyTG4NJkvshfv+vBAUfL0wuTxxS6Zt/cLle41kvwEqGKY+vGp3g
	5QWTfzP+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8AmF-0007sw-9m; Fri, 05 Feb 2021 23:44:39 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8AmC-0007sI-NT
 for linux-i3c@lists.infradead.org; Fri, 05 Feb 2021 23:44:38 +0000
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D1F17200009;
 Fri,  5 Feb 2021 23:44:31 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: Re: [PATCH v5 0/6] Silvaco I3C master driver
Date: Sat,  6 Feb 2021 00:44:29 +0100
Message-Id: <161256866173.4836.10256863699232447925.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121101808.14654-1-miquel.raynal@bootlin.com>
References: <20210121101808.14654-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_184436_897175_B7C1D449 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Conor Culhane <conor.culhane@silvaco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nicolas Pitre <nico@fluxnic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 21 Jan 2021 11:18:02 +0100, Miquel Raynal wrote:
> Here is the addition of a driver for the Silvaco I3C master IP.
> 
> Changes in v5:
> * Added Rob's R-by when relevant.
> * Fixed the robots warnings by pushing a little bit forward the changes in the
>   mipi-hci binding file.
> * Fixed the I3C master node name regex.
> * Removed the redundant $ref: entries when the hz suffix is used.
> * Simplified a little bit the regexes defining the child nodes.
> * Updated the reg propertie description to better describe each entry.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: i3c: Convert the bus description to yaml
      commit: 5e4cdca887fdb445f962b3dbc2a2514d7c025d9b
[2/6] dt-bindings: i3c: mipi-hci: Include the bus binding
      commit: de67276e66fcfcd404516eebfd6436239dd9882a
[3/6] dt-bindings: Add vendor prefix for Silvaco
      commit: 57f7c9ff1b3fdc2cccb377207e538bf5f3ab03cf
[4/6] dt-bindings: i3c: Describe Silvaco master binding
      commit: b8b0446f1f1afd58e5a9ba14ab2caa08797f3bb5
[5/6] i3c: master: svc: Add Silvaco I3C master driver
      commit: dd3c52846d5954acd43f0e771689302f27dadc28
[6/6] MAINTAINERS: Add Silvaco I3C master
      commit: f06a1af8e739cb573b79cd175fd88534e912bea0

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

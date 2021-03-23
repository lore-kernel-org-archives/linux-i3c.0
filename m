Return-Path: <SRS0=UEAv=IV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A070AC433C1
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Mar 2021 21:19:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05149619CA
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Mar 2021 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05149619CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3W9TvaxVMxIfeuGMQ/dwTycFOqL9BGebHky82hx5/ks=; b=Mw1tpChKBvKBbhx3NdTDlTNUm
	Lx4jHAnM+y6x/Qfsa6/FT2Lb0hupRRV/9soI4Z/TX06BxaDzd1bjE6K1KX4pDGrK1sg38P+25ZBI3
	52XmKBE6oDVW2D4whpLf90XSoqtutN2A7cZ1BqRptB/ymwf2eTy0YjiW2AdwA6cTUY42rBddQlo9V
	sKBKpy9bYm9aZE/9DuwmYqaAwq1adif6tqVNJtiygyHXU/IvqTUbxyEIykbfYZIyMQ5N1N2sS8zMQ
	a3OunJ1zoNi3N5u4nHz7qpbb2FfhDHzsu3mPtus7M7Mqx7rg7PDTTOCSz00Vr7KP8xVEFnhFzScQW
	0etFDSgyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOoRG-00Flww-N8; Tue, 23 Mar 2021 21:19:47 +0000
Received: from relay13.mail.gandi.net ([217.70.178.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOoRC-00Flvw-Jz
 for linux-i3c@lists.infradead.org; Tue, 23 Mar 2021 21:19:44 +0000
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay13.mail.gandi.net (Postfix) with ESMTPSA id CA9608000B;
 Tue, 23 Mar 2021 21:19:39 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Conor Culhane <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i3c: Fix silvaco,
 i3c-master-v1 compatible string
Date: Tue, 23 Mar 2021 22:19:39 +0100
Message-Id: <161653435327.363771.4551073888440261165.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210311234056.1588751-1-robh@kernel.org>
References: <20210311234056.1588751-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_211942_801948_E0129F1F 
X-CRM114-Status: UNSURE (   5.09  )
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

On Thu, 11 Mar 2021 16:40:56 -0700, Rob Herring wrote:
> The example for the Silvaco I3C master doesn't match the schema's
> compatible string. Fix it.

Applied, thanks!

[1/1] dt-bindings: i3c: Fix silvaco,i3c-master-v1 compatible string
      commit: e43d5c7c3c3459b428431754672052503c5db9c8

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

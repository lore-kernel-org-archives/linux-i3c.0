Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C397C83F17
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Jul 2025 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3n/h36u3nNbJtXdvJumxgCynMEcdC0aJjEOVWSog+A=; b=nRQ0VdYw9tNGyz
	pa0SX/bDDi0eHWw6+njPPdPbyn/6lfvtoj86wmgWaRK/RLTmHBoELnvLZUkfcVVkUMNjTR9iARW1S
	rJXkoR5awx0oqWWdu4b2n7SSuJBO250DVxm6d3igG/1BfKczC5qOoatEs+G4iI1b3rlWgziOfWs+x
	Lvu0HIATypXNuLaFcImUdo/bqkF6Eq9RAB3xfKpzdkC8vQ6niqFfLoX92zpfm10kK0auYeBIQ6tRR
	0myQYFQOaRXDZLzeXVQmrebc1DtMTSMGy893wslb40wuw/uyOqYjoPWQoPjBizBfL793+XN6ejUa/
	9sMepH4L3/zt20kkBBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedcK-00000005fEd-0G2Z;
	Wed, 23 Jul 2025 17:51:00 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedcF-00000005fDF-2MVB
	for linux-i3c@lists.infradead.org;
	Wed, 23 Jul 2025 17:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wyq4
	dQ0+Jpg9weDVfRPIFSVr09+pmF/YagTxo92Vv88=; b=mbRHBk0Mph+vvNXaGxZb
	Qc+GG/dTDm05unPxyz5EPvyip8l70WtnA+XnYg6GI5W4w4M6ySNe2gLXxyUyFTBk
	8IupTlsNZ4ZbokuXmV9pstYbKDWseYmksa4lHU+fnxoJgjRTFqCwPl/cJDqq2gb+
	gHP5IbZzd+BRoZPVTJVg6NQuPA/g/CqcOhpyoAaNsqV0AbpAXeHR2JWtJqLjCH8H
	LdNv15KATQ0gyzL/78OSLjmxt6ZGWPADYG2J3nv/b423Qo5+TGiUING0EFsZwwnb
	MpN2Svlqlhu5KkZ09M9GaNtOZ4IWyekWTidm2ZY5z4rUuS1W9CaqnjqBWgWec6dG
	9g==
Received: (qmail 1786777 invoked from network); 23 Jul 2025 19:50:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jul 2025 19:50:50 +0200
X-UD-Smtp-Session: l3s3148p1@VNV3WZw6Gt8ujnvr
Date: Wed, 23 Jul 2025 19:50:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aIEg-qyGhb8B2Rep@shikoro>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
 <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
 <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_105056_473677_1EF3CE25 
X-CRM114-Status: UNSURE (   6.74  )
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


> > +/* TODO: Document a reason for this value */
> 
> Todo? Can you finish it?

Yes, but in a seperate patch series where the value is to be changed.

This needs additional testing because I want to update the other I3C
controller drivers as well.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

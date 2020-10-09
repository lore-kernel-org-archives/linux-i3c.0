Return-Path: <SRS0=Bx2u=DQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB193C433E7
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Oct 2020 12:02:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB701206B2
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Oct 2020 12:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iD/T8uLq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB701206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eXkss9s9Xz1Bktn/ousIn0z9GK2Pjm3tzbFDaWXgTZ4=; b=iD/T8uLqx86qlIVo9CNDsNByG
	vA2xJ+YXDobmIC1YQNzAHhyYVCGcSsaz/ikeMHz3imQsxCss4LFMMiqo/RqbXUCqyw/P6l0DA9srD
	LgUMn0aLZbBBpoVumsR+JFxvJbKxmczmCbejoZSxPBBT23XHy8dC9R8hx2X9IwEYlZmexls6pR10Y
	82Zs7DaWsBAKeOkw0XTtAzndjbIGa5BjMjbaa+8+lRwTLXuDvrJtoOFipx0vL8kY0jNE8gKkYnM1i
	ghoofauXlN9ze82svXXgiNHzXb5y/Xm9dxbBHyBZct4PHFF5QY5oPx7QBzWpUxLs3FFTpXrmCAFq/
	lzNbMeDVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQr6Z-00056y-N0; Fri, 09 Oct 2020 12:02:35 +0000
Received: from hillosipuli.retiisi.eu ([2a01:4f9:c010:4572::81:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQr6W-00055C-Om
 for linux-i3c@lists.infradead.org; Fri, 09 Oct 2020 12:02:34 +0000
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4FC07634C87;
 Fri,  9 Oct 2020 15:01:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1kQr5c-00028l-53; Fri, 09 Oct 2020 15:01:36 +0300
Date: Fri, 9 Oct 2020 15:01:36 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2 2/2] i3c/master: add the mipi-i3c-hci driver
Message-ID: <20201009120135.GG6413@valkosipuli.retiisi.org.uk>
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-3-nico@fluxnic.net>
 <20201001123103.GJ2024@valkosipuli.retiisi.org.uk>
 <nycvar.YSQ.7.78.906.2010051528570.2184@knanqh.ubzr>
 <20201007101718.GA6413@valkosipuli.retiisi.org.uk>
 <nycvar.YSQ.7.78.906.2010071129120.2184@knanqh.ubzr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.78.906.2010071129120.2184@knanqh.ubzr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_080232_965529_C510CD4B 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: Laura Nixon <laura.nixon@team.mipi.org>, linux-i3c@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Robert Gough <robert.gough@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

On Wed, Oct 07, 2020 at 12:30:59PM -0400, Nicolas Pitre wrote:
...
> > > So there are couple precedents already.
> > 
> > These look more like accidents rather than informed decisions to merge
> > BSD-only licensed code. I'd still say no.
> 
> BSD-only licensed code _is_ OK per the rules clearly and 
> unambiguously quoted above. It's not a matter of opinion.
> 
> That is the license to be used per the policy from the organisation 
> sponsoring this work. This even had to go through legal approval before 
> I was allowed to post this code here.

Fair enough.

Please still mention this in the cover page of further versions of this set
so this isn't missed by other reviewers.

-- 
Kind regards,

Sakari Ailus

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

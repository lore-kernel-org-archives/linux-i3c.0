Return-Path: <SRS0=EJcj=BP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7C7C433DF
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2020 15:22:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C3422BED
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2020 15:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n6eyBT/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C3422BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c+LPaSTUmRtAMS6X+8BEMWTA4hg2M/15hdU++/GgvlE=; b=n6eyBT/V9nyKgfZHWTKeW7tyD
	7ZgA0hiNOHwOswi+/pQhtyftHxYCV+ogVrxvbdGftq8JMV3ogolKR8PdkmSWSpwAHtbjLeVch4Qpv
	pBcEscD2EMh76HP7nBSZDSpRMcJv9cfGLOAflp5UP1zQBFZEIfmEYq1rxMdM3i0+0IF3my/VPb4mh
	EclLw/XU4ZmSjAI1uvZarvi2E6xEercO36vnwYkN77VsMVNgg1PSsqQhnmRg0Giz0sl4x8uanIb3M
	N2NhN8OmGcc5OHY/iVzk28hFGaoytXyNNIApqUSMRS1ovvwmefDyAila8qMMveKyQEUbJnuTBGMto
	VW3NC7aZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3LFK-0005gQ-J5
	for linux-i3c@archiver.kernel.org; Wed, 05 Aug 2020 15:22:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3LFI-0005fx-Ko
 for linux-i3c@lists.infradead.org; Wed, 05 Aug 2020 15:22:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 385F760004;
 Wed,  5 Aug 2020 15:22:18 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:22:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 3/4] i3c: master: svc: Add Silvaco I3C master driver
Message-ID: <20200805172217.27a00af5@xps13>
In-Reply-To: <nycvar.YSQ.7.77.849.2008051105550.1112668@knanqh.ubzr>
References: <20200709080159.2178-1-miquel.raynal@bootlin.com>
 <20200709080159.2178-3-miquel.raynal@bootlin.com>
 <nycvar.YSQ.7.77.849.2008031546570.1112668@knanqh.ubzr>
 <BN6PR16MB1762D6CE430AB08B7A2BE5FCF14A0@BN6PR16MB1762.namprd16.prod.outlook.com>
 <nycvar.YSQ.7.77.849.2008051105550.1112668@knanqh.ubzr>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_112224_783296_B62D80E5 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgTmljb2xhcywKCk5pY29sYXMgUGl0cmUgPG5pY29AZmx1eG5pYy5uZXQ+IHdyb3RlIG9uIFdl
ZCwgNSBBdWcgMjAyMCAxMToxMzo0MQotMDQwMCAoRURUKToKCj4gT24gVHVlLCA0IEF1ZyAyMDIw
LCBDb25vciBDdWxoYW5lIHdyb3RlOgo+IAo+ID4gTWlxdWVsIGlzIHBhc3NpbmcgMCBhcyB0aGUg
ZGVsYXlfdXMgYXJndW1lbnQuICAKPiAKPiBHb29kIHBvaW50Lgo+IAo+ID4gSXMgdGhpcyBzdGls
bCBhIGNvbmNlcm4/ICAKPiAKPiBOb3QgaW4gdGhhdCBjYXNlLgoKSSB3aWxsIGNoZWNrIGFnYWlu
IGlmIGxvb3Bpbmcgb3ZlciB0aGlzIHJlZ2lzdGVyIHJlYWQgYWN0dWFsbHkKbWFrZXMgc2Vuc2Ug
b3Igbm90LiBJZiB5ZXMsIEkgd2lsbCBhZGQgYSBjb21tZW50IGhlcmUuCgpUaGFua3MsCk1pcXXD
qGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==

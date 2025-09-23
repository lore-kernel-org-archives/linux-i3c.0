Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E4CAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=at4u4J4bX+SQAcOnJ93oEFowxaWrikEjgZzkOt4fxLY=; b=foZvsG8vhtth2SReHU5dR0L+3T
	t+1LJSn8NafuWBX2+JwWG81fS0C0mSW3Y4WcT3ba9Z4KsJL14tXSskPFP+cPmrH8S1hCsWcL2sI13
	drVkqrbZNF5t6gapGOMVvD+yFs6OLRAXq/nVLJhLpYa7yj77Cc3lr2uLuNIikYLntHkevtAHHXDx7
	qmopZfFM2gRCZE3Dy7lOOst9iLZ8OXB0m8Ommt9lrzrepYv4K8GhXYlX1XZMk3HHd25Y2cIFM7cVn
	iyiNFNWMV0ZvWOTcMuOoQb1tPstFatAi5PVQngB0VmHXLloq67EwFiWgwUYw7wEOYGma/7wu/dFrj
	zwsT5F4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17uJ-0000000EYZf-1no0;
	Tue, 23 Sep 2025 18:38:31 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17uG-0000000EYZF-1id4
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 18:38:30 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 386B37A005A;
	Tue, 23 Sep 2025 14:38:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 23 Sep 2025 14:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758652706;
	 x=1758739106; bh=nrFGLCTqsqckTBO72y0mzJiE3AI4L/6qnMuJTwts27c=; b=
	lJn6nA1HpgkmgmqwMc38pEELag25O4m7V1154CFjEaF2JMyFFxmEy3ky5K0Wvbjh
	yEBVh2XTFkA4eGaO9e5WziEm/2NJI4XXh63+AIzc3NQwb37RmtIGXg5CZOJG4X76
	gzqobwRnrswlXWsdKmio53LajbWZ3xI0Jwu+sAO7+MwhtDRYYaBS+YgzgEoqNZ7W
	oTFx/DDHWRlKyXtoJbOuVng0PYJCRwGoZWHFzQkFEZaCTirKlL9dOWuGW/PrTCiX
	jC1vLziFkOifmn67n5balgePsmEuYvbbFFF5I7U8vIYyHX1UnVX9RSLZjymTTBTd
	d5PHIXb6fm8fetq6zUPt2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758652706; x=
	1758739106; bh=nrFGLCTqsqckTBO72y0mzJiE3AI4L/6qnMuJTwts27c=; b=J
	YAXmHckyu4MQkIOlTYEc6J05OCQk7KMy0rYBvhKm+/KiQDgRTRxZlBjuzI6cvJxv
	njBPteLk5DpaneGgjfPuiA/ByYRFTkdhdDsZ9l4xP0HNZ1GyxyyoNcNwhMfZqxO1
	M3cTJZCaD9qE7FX4Cec+YH0V0sPB/TYweSAzdxQ6F5Bv7bI+IlcxNavD+1PbH65l
	W2V5maIkVHUD3xRqPkSQVS65qkH68Fc52n3qzDIp3F0lsw6f5xhM0eVvFTSJu0DI
	xNanhvIL6t4Ien8+l3w2WGC7qzmsB3l2Dzinm1uueUtss82fqCWJQmk2ZNSOaLKH
	cOXUr5jq6EKcoCBo76YSg==
X-ME-Sender: <xms:H-nSaPZowPSpN4ObvaPjHY1jIFD0LaqDAgXiXr23B5wn871_AGHJag>
    <xme:H-nSaJOIkAbliPKAXAasNevLFglGIpEpjqmd68BcffpEwucw2MpCPZP8M9D1aR_nl
    5HbUhaI7HcwyCXjiaazE31tXiOzMpMVfL5YVKcd0EoW7cND4_VpFZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhhhigrmhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhrtg
    hpthhtohepghhithesrghmugdrtghomhdprhgtphhtthhopehmrghnihhkrghnthgrrdhg
    uhhnthhuphgrlhhlihesrghmugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimh
    gvkhesrghmugdrtghomhdprhgtphhtthhopehrrgguhhgvhidrshhhhigrmhdrphgrnhgu
    vgihsegrmhgurdgtohhmpdhrtghpthhtohepshhhuhgshhhrrghjhihothhirdgurghtth
    grsegrmhgurdgtohhmpdhrtghpthhtohepshhrihhnihhvrghsrdhgohhuugesrghmugdr
    tghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomh
    dprhgtphhtthhopegsihhllhihpghtshgrihesrghsphgvvgguthgvtghhrdgtohhm
X-ME-Proxy: <xmx:H-nSaFBWn68svDp462uoZMn7DaJxZR9ykjAminvbrPesSi1cjHpcwg>
    <xmx:H-nSaFdOPTr3hanxMTPGv8vnrYSE9G3UU2l3Ky8Lr8UsSzCwb-mxng>
    <xmx:H-nSaK94NjpD3eg0hYqCK5Wqdb8sjguBgaZCFvTczesvvexkmohbZg>
    <xmx:H-nSaNHCZKDKQnAY0Ntz2XWSItuejCrSVw1e1jm7X4alD8fCeksUAw>
    <xmx:IunSaAHS6yrl0ixjA0hmHQn6FInEVKycskBZTF3F8YsXkHnTmo3xiJwj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C605F70006B; Tue, 23 Sep 2025 14:38:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5BcZzk33eMV
Date: Tue, 23 Sep 2025 20:38:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, git@amd.com,
 "Michal Simek" <michal.simek@amd.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 tommaso.merciai.xr@bp.renesas.com, quic_msavaliy@quicinc.com,
 Shyam-sundar.S-k@amd.com, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
 "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Jorge Marques" <jorge.marques@analog.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-hardening@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Message-Id: <cde37e36-4763-48ca-a038-4a19eb1ef914@app.fastmail.com>
In-Reply-To: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_113828_908189_461BED8D 
X-CRM114-Status: UNSURE (   8.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMjMsIDIwMjUsIGF0IDE3OjQ1LCBNYW5pa2FudGEgR3VudHVwYWxsaSB3cm90
ZToKPiBBZGQgTU1JTyBhY2Nlc3NvcnMgdG8gc3VwcG9ydCBiaWctZW5kaWFuIG1lbW9yeSBvcGVy
YXRpb25zLiBUaGVzZSBoZWxwZXJzCj4gaW5jbHVkZSB7cmVhZCwgd3JpdGV9e3csIGwsIHF9X2Jl
KCkgYW5kIHtyZWFkLCB3cml0ZX1ze3csIGwsIHF9X2JlKCksCj4gd2hpY2ggYWxsb3dzIHRvIGFj
Y2VzcyBiaWctZW5kaWFuIG1lbW9yeSByZWdpb25zIHdoaWxlIHJldHVybmluZwo+IHRoZSByZXN1
bHRzIGluIHRoZSBDUFXigJlzIG5hdGl2ZSBlbmRpYW5uZXNzLgo+Cj4gVGhpcyBwcm92aWRlcyBh
IGNvbnNpc3RlbnQgaW50ZXJmYWNlIHRvIGludGVyYWN0IHdpdGggaGFyZHdhcmUgdXNpbmcKPiBi
aWctZW5kaWFuIHJlZ2lzdGVyIGxheW91dHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FudGEg
R3VudHVwYWxsaSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAYW1kLmNvbT4KCkkgZmVlbCBsaWtlIHdl
IGFscmVhZHkgaGF2ZSB0b28gbWFueSBhY2Nlc3NvciBmdW5jdGlvbnMgbGlrZSB0aGVzZSwKd2hh
dCdzIHdyb25nIHdpdGgganVzdCB1c2luZyBpb3tyZWFkLHdyaXRlfXs4LDE2LDMyLDY0fWJlKCkg
aW4KeW91ciBkcml2ZXI/CgpPbiBtb3N0IGFyY2hpdGVjdHVyZXMgKGluY2x1ZGluZyBhcm0sIHJp
c2N2LCBwb3dlcnBjIGFuZCBtaWNyb2JsYXplLApidXQgbm90IHg4NiksIHRoZSBpb3JlYWQvd3Jp
dGUgaGVscGVycyBhcmUgaWRlbnRpY2FsIHRvIHRoZQpyZWFkbC93cml0ZWwgc3R5bGUgaGVscGVy
cywgdGhlIG9ubHkgZGlmZmVyZW5jZSBiZWluZyB0aGF0IG9uIHg4Ngp0aGV5IGFkZCBhbiBleHRy
YSBpbmRpcmVjdGlvbiBmb3IgdGhlIHBvcnQgSS9PIGNoZWNrLgoKQXQgdGhlIG1vbWVudCwgdGhl
cmUgYXJlIG9ubHkgc2l4IGRyaXZlcnMgdGhhdCB1c2UgdGhlCmlve3JlYWQsd3JpdGV9ezgsMTYs
MzIsNjR9YmUoKSBzdHlsZSBoZWxwZXJzLiBUaGV5CmFyZSBhbGwgcG93ZXJwYyBzcGVjaWZpYyBh
bmQgY2FuIHByb2JhYmx5IGJlIGNoYW5nZWQKdG8gaW97cmVhZCx3cml0ZX1iZS4KCiAgICAgIEFy
bmQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==

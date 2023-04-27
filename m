Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D63C77B61
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Apr 2023 23:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntEcCx8r6awl0q4JIZOxz6NBU9lHEaZHU4MKvdlfzrg=; b=aIcKtT9k6NH4tA
	ghgH0ohrTFH4CFaF/FskNu7O8IVrKWKsHbe8IN7bLUK7ZBWqtrSF+J7DyVWLT24J6gXsBFcDsOSec
	di20VgI5oRCj2eIOOadgHgpPd/NYa1dTmDR7VNYBkCNREgUAGVebxCw3qOkdXE7e719Zu3ukY9KTv
	iNo5fr5aJ1qCllRtuGh1Pjr1w+gcRye0IxwiyQYgYZ4RQ6CguZE5t1CBLnfFY1Y+6vPWdgDa1gXOo
	63aUHMmZWM5NtQOl/FZrlNecrdij21lc78s/4myNaNgSQgEKKhgic4FzSQdkpkazQ3qswyTF9nsqk
	ZLdRTp70fFVUjPpbR5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psBW6-007ptO-0N;
	Thu, 27 Apr 2023 23:59:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psBW3-007psR-20
	for linux-i3c@lists.infradead.org;
	Thu, 27 Apr 2023 23:59:12 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 891CF20009;
	Fri, 28 Apr 2023 07:58:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1682639934;
	bh=HTlmV6ZYUailRTclcFWB41eToJ0kSd2aafbUpDtmzXM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aBeprQVzla52BpBzP4NDOD/EXYT0gCz5f/mBvPv3jwVqFXYNrXdbADJhjxk5EI88t
	 V1vDNRV4whgTv6fq1xKG8dqir0OP6olRos15WbZ8DWGcCo4quuskgrO+wsvsA8W8eu
	 4xnjzTe62VTdrXiIHhshul5GVO3isB4u6BROzVyXRHVINsiXZ0QcBOJxpaP62MRu8x
	 Re9YOC4oL3z16L8kxZeCOA7fNbpMYqLIQEOOm1WPXpJcHYI0AvHoXkaYbqqlrIiCA8
	 h75nIYkiXElBXVHeva9tsbmmmdNWoRBBXoOMNJvKJYKC8bJdbKZY7tXxzJbduUI5Gr
	 NgiuDvQV/CDWg==
Message-ID: <25ee56f181b11baa9ef54f13b6ef37977ee48b68.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/3] i3c: ast2600: Add AST2600 platform-specific
 driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>, 
	linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Matt Johnston
 <matt@codeconstruct.com.au>, Vitor Soares <ivitro@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jack Chen <zenghuchen@google.com>, Billy
 Tsai <billy_tsai@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 28 Apr 2023 07:58:50 +0800
In-Reply-To: <671a4bc0-526e-5224-7cb9-f80ebab2c0ef@linux.intel.com>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
	 <20230331091501.3800299-4-jk@codeconstruct.com.au>
	 <671a4bc0-526e-5224-7cb9-f80ebab2c0ef@linux.intel.com>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_165911_876917_FE224B2D 
X-CRM114-Status: UNSURE (   6.31  )
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

SGnCoEx1a3dpbnNraSwKCj4gPiArCWNhc2UgNTQ1Ogo+ID4gKwkJcmVnID0gQVNUMjYwMF9JM0NH
X1JFRzBfU0RBX1BVTExVUF9FTl8ySyB8Cj4gPiArCQkJQVNUMjYwMF9JM0NHX1JFRzBfU0RBX1BV
TExVUF9FTl83NTA7Cj4KPiBJdCBkb2VzIG5vdCB3b3JrLiBUbyBlbmFibGUgUHVsbFVwPTU0NVIg
eW91IG5lZWQgdG8gc2V0IGJvdGggMjggYW5kCj4gMjkgYml0ICgweDMwMDAwMDAwKSBidXQgJ0FT
VDI2MDBfSTNDR19SRUcwX1NEQV9QVUxMVVBfRU5fMksgfAo+IEFTVDI2MDBfSTNDR19SRUcwX1NE
QV9QVUxMVVBfRU5fNzUwJyBpcyBpbiBmYWN0IDB4MjAwMDAwMDAuCgpBaCwgZ29vZCBjYXRjaCAt
IEknZCBtaXNzZWQgdGhhdCB0aGUgMksgaXMgMGIwMC4KCj4gTWF5YmUgeW91IGNvdWxkIGNvbnNp
ZGVyIGFkZGluZyBleHRyYSBtYWNybwo+ICdBU1QyNjAwX0kzQ0dfUkVHMF9TREFfUFVMTFVQX0VO
XzU0NScgPSAoMHgzIDw8IDI4KT8KClNvdW5kcyBnb29kLCBJJ2xsIHNlbmQgYSBmaXggdG9kYXku
CgpDaGVlcnMsCgoKSmVyZW15CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=

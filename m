Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C43C41535
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Dec 2023 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyBJllQnOGHtau3fLyr6puK+68HZQsM71XciWuyg/BY=; b=GQtJfy1xAI5hZK
	zyBhTWsGPf9fNM7spB0B23nQo8i8MYG/ehWQoLrqKwTI/vcPjxv+1FCG4UEDlqjMCaZmuL63nKRWs
	Qd/BpxBZl9JAl5aG8fvSQ2XtYvk9VPbwTxuLyjB2qCBi5q5pS8y98q3kkip4RI31ZRPKqT1PGN6tn
	OFIKIs98kxt8p9ocg0prz7l5C9HDJUc4LK7LiAiHA2KoTCkg3MIzDhasVcZTrTEDOlJ9lT9kaL0y0
	LkGTdG5bzp0FGrCCmerJQFL3Q0EfCJ8vrRENk5cLIN51G7H85THEvmNUw9M9yrKcgg289sxk6j5nL
	VEV9dfaAk5rb2WaCwwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFloF-00FwPE-1j;
	Wed, 20 Dec 2023 01:55:43 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFloD-00FwOR-07
	for linux-i3c@lists.infradead.org;
	Wed, 20 Dec 2023 01:55:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0A7C224DBFD;
	Wed, 20 Dec 2023 09:55:29 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 20 Dec
 2023 09:55:28 +0800
Received: from [192.168.151.176] (172.16.6.8) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 20 Dec
 2023 09:55:27 +0800
Message-ID: <2cfc670f-56ad-4453-82f3-d72dcfd05840@starfivetech.com>
Date: Wed, 20 Dec 2023 09:55:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 resend 3/6] i3c: add actual_len in i3c_priv_xfer
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, <miquel.raynal@bootlin.com>
CC: <alexandre.belloni@bootlin.com>, <conor.culhane@silvaco.com>,
	<imx@lists.linux.dev>, <joe@perches.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <zbigniew.lukwinski@linux.intel.com>
References: <20231201222532.2431484-1-Frank.Li@nxp.com>
 <20231201222532.2431484-4-Frank.Li@nxp.com>
From: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <20231201222532.2431484-4-Frank.Li@nxp.com>
X-Originating-IP: [172.16.6.8]
X-ClientProxiedBy: EXCAS081.cuchost.com (172.16.6.41) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_175541_234142_3EC66B38 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Ck9uIDAyLzEyLzIwMjMgNjoyNSBBTSwgRnJhbmsgTGkgd3JvdGU6Cj4gSW4gTUlQSSBJM0MgU3Bl
Y2lmaWNhdGlvbjoKPgo+ICJOaW50aCBCaXQgb2YgU0RSIFRhcmdldCBSZXR1cm5lZCAoUmVhZCkg
RGF0YSBhcyBFbmQtb2YtRGF0YTogSW4gSTJDLCB0aGUKPiBuaW50aCBEYXRhIGJpdCBmcm9tIFRh
cmdldCB0byBDb250cm9sbGVyIGlzIGFuIEFDSyBieSB0aGUgQ29udHJvbGxlci4gQnkKPiBjb250
cmFzdCwgaW4gSTNDIHRoaXMgYml0IGFsbG93cyB0aGUgVGFyZ2V0IHRvIGVuZCBhIFJlYWQsIGFu
ZCBhbGxvd3MgdGhlCj4gQ29udHJvbGxlciB0byBBYm9ydCBhIFJlYWQuIEluIFNEUiB0ZXJtcywg
dGhlIG5pbnRoIGJpdCBvZiBSZWFkIGRhdGEgaXMKPiByZWZlcnJlZCB0byBhcyB0aGUgVC1CaXQg
KGZvciDigJhUcmFuc2l0aW9u4oCZKSIKPgo+IEkzQyBhbGxvdyBkZXZpY2VzIGVhcmx5IHRlcm1p
bmF0ZSBkYXRhIHRyYW5zZmVyLiBTbyBuZWVkICJhY3R1YWxfbGVuIiBmaWVsZAo+IHRvIGluZGlj
YXRlIGhvdyBtdWNoIGdldCBieSBpM2NfcHJpdl94ZmVyLgo+Cj4gUmV2aWV3ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4KPiBOb3RlczoKPiAgICAgIGNoYW5nZSBm
cm9tIHY0IHRvIHY1Cj4gICAgICAtIEFkZCBNaXF1ZWwgcmV2aWV3IHRhZwo+Cj4gICBpbmNsdWRl
L2xpbnV4L2kzYy9kZXZpY2UuaCB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaCBiL2luY2x1
ZGUvbGludXgvaTNjL2RldmljZS5oCj4gaW5kZXggOTBmYTgzNDY0ZjAwMy4uZWY2MjE3ZGE4MjUz
YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvaTNjL2RldmljZS5oCj4gQEAgLTU0LDYgKzU0LDcgQEAgZW51bSBpM2NfaGRyX21v
ZGUgewo+ICAgICogc3RydWN0IGkzY19wcml2X3hmZXIgLSBJM0MgU0RSIHByaXZhdGUgdHJhbnNm
ZXIKPiAgICAqIEBybnc6IGVuY29kZXMgdGhlIHRyYW5zZmVyIGRpcmVjdGlvbi4gdHJ1ZSBmb3Ig
YSByZWFkLCBmYWxzZSBmb3IgYSB3cml0ZQo+ICAgICogQGxlbjogdHJhbnNmZXIgbGVuZ3RoIGlu
IGJ5dGVzIG9mIHRoZSB0cmFuc2Zlcgo+ICsgKiBAYWN0dWFsX2xlbjogYWN0dWFsIGxlbmd0aCBp
biBieXRlcyBhcmUgdHJhbnNmZXJyZWQgYnkgdGhlIGNvbnRyb2xsZXIKPiAgICAqIEBkYXRhOiBp
bnB1dC9vdXRwdXQgYnVmZmVyCj4gICAgKiBAZGF0YS5pbjogaW5wdXQgYnVmZmVyLiBNdXN0IHBv
aW50IHRvIGEgRE1BLWFibGUgYnVmZmVyCj4gICAgKiBAZGF0YS5vdXQ6IG91dHB1dCBidWZmZXIu
IE11c3QgcG9pbnQgdG8gYSBETUEtYWJsZSBidWZmZXIKPiBAQCAtNjIsNiArNjMsNyBAQCBlbnVt
IGkzY19oZHJfbW9kZSB7Cj4gICBzdHJ1Y3QgaTNjX3ByaXZfeGZlciB7Cj4gICAJdTggcm53Owo+
ICAgCXUxNiBsZW47CldoYXQgaGFwcGVucyBpZiBJM0MgZGV2aWNlIGRvZXMgbm90IHRlcm1pbmF0
ZSB0aGUgVC1CaXQgYmVjYXVzZSBpdCAKZXhwZWN0cyBleHRyYSBsZW5ndGggZnJvbSBtYXN0ZXI/
Cj4gKwl1MTYgYWN0dWFsX2xlbjsKPiAgIAl1bmlvbiB7Cj4gICAJCXZvaWQgKmluOwo+ICAgCQlj
b25zdCB2b2lkICpvdXQ7CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=

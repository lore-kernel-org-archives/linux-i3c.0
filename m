Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4290CC0218D
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jan 2025 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfbPeExeeHIb7tJeB9iNzqaq7P8erdaRSjCarRVbbgw=; b=VU1qEKJN0U11S+
	WA0/6mFZU9OF3YIptfu1aI/nW8pnDqGkEBIfe/Eq2kbw/xXqQwfPyffEATCjI7bCUwSJ/DgPDJiPS
	8EyNYU6YcnoeRXryej1s2brt0Oo9NDtUPF7Y21p630FaZFUSsjJCgUp/Dt8Azvx13OmCjoI+zGwrO
	IJol9nwyd6Ld6r+kHRuPGXkNqsTEaGgXb8M+T7nGLFrjGkv9xL+VFgVteGnr1xhLOU/asVUNU4hvD
	e4gFBG6k2KvYLevhQ+uvqacGQXgo/5yWTeo16A2l9qvWL5ebPoCvEp+yvvGJu63G/Kbyiehak764X
	Shp45lYfGrXdAexI0Atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmlk-0000000AFPl-455N;
	Fri, 31 Jan 2025 08:52:56 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmlh-0000000AFOc-47Qk
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jan 2025 08:52:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C52DF4418E;
	Fri, 31 Jan 2025 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738313571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpmSDx46TO6i4J+NUBpfArqU26FaAW0U8OYqGK/1HO0=;
	b=EXOQMQXae6ICAEwyb/yK+nmSUWhnq5mQddMqTblPgTT4pxe2FqWBPJl5JpOXPcMePGYJyD
	UyTmHHyNuRTCpRsl2VRpX178AjbmVsDiPXwl/p6QBj55g7rfYlge7aSuh1hOwRCWuEavHo
	S7zi7mnD7RjS7qo2J39VSw6RNmiBzH+pm0uQt2sl4ZdVTo3Ipgx9f+1UVFUWAk1ds7rk+b
	ooDHVG1l77Qj/fzpwUc7plPsjrqyYHBEUbDvheEeMj1RBWX3P07vTR/RsLA4zQ3voN9Owa
	C40S5Pt8nIaaFYYTUMhuFFCRs5aPDVOAJoKehmBrYZCmXyxe6A0SPuKuj+TbYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER),  linux-kernel@vger.kernel.org (open
 list),  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Flush FIFO before sending Dynamic
 Address Assignment(DAA)
In-Reply-To: <20250129162250.3629189-1-Frank.Li@nxp.com> (Frank Li's message
	of "Wed, 29 Jan 2025 11:22:50 -0500")
References: <20250129162250.3629189-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 31 Jan 2025 09:52:48 +0100
Message-ID: <87bjvnz7of.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrfeefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_005254_521566_6A93B42B 
X-CRM114-Status: UNSURE (   7.99  )
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

T24gMjkvMDEvMjAyNSBhdCAxMToyMjo1MCAtMDUsIEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
PiB3cm90ZToKCj4gRW5zdXJlIHRoZSBGSUZPIGlzIGVtcHR5IGJlZm9yZSBpc3N1aW5nIHRoZSBE
QUEgY29tbWFuZCB0byBwcmV2ZW50Cj4gaW5jb3JyZWN0IGNvbW1hbmQgZGF0YSBmcm9tIGJlaW5n
IHNlbnQuIEFsaWduIHdpdGggb3RoZXIgZGF0YSB0cmFuc2ZlcnMsCj4gc3VjaCBhcyBzdmNfaTNj
X21hc3Rlcl9zdGFydF94ZmVyX2xvY2tlZCgpLCB3aGljaCBmbHVzaGVzIHRoZSBGSUZPIGJlZm9y
ZQo+IHNlbmRpbmcgYSBjb21tYW5kLgo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5r
LkxpQG54cC5jb20+Cj4gLS0tCj4gSG90cGx1ZyBzdHJlc3MgdGVzdCBmaW5kIGEgd3JvbmcgYnl0
ZSBzZW5kIG91dCwgdGhpcyBwYXRjaCBjYW4gcmVzb2x2ZQo+IHRoaXMgaXNzdWUgYWx0aG91Z2gg
aGF2ZSBub3QgaWRlbnRpZnkgd2hpY2ggb3BlcmF0aW9uIGNhdXNlIGEgYnl0ZSBsZWZ0IGluCj4g
RklGTy4KClRoYXQncyBleGFjdGx5IHdoYXQgSSB1bmRlcnN0b29kIGZyb20geW91ciBjb21taXQg
bG9nLCBJIGhhdmUgbWl4ZWQKZmVlbGluZ3MgYWJvdXQgdGhlIHBhdGNoIGJlY2F1c2UgaXQgcHJv
YmFibHkgaGlkZXMgc29tZXRoaW5nIGJpZ2dlci4gTm90CnRoYXQgSSB3YW50IHRvIGJyZWFrIHVz
ZXJzLCBidXQgdGhlcmUgaXMgbGlrZWx5IHNvbWV0aGluZyBlbHNlIHRvIGRvIHRvCmF2b2lkIGl0
LiBJcyB0aGVyZSBhbnkgY2hhbmNlIHlvdSBjYW4gY2hlY2sgdGhlIGNvbnRlbnQgb2YgdGhlIEZJ
Rk8gYW5kCndhcm4gYmVmb3JlIGZsdXNoaW5nIChhdCBsZWFzdCB3aGlsZSBkZWJ1Z2dpbmcpPwoK
QW55d2F5LAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==

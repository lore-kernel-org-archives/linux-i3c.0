Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB869C5B549
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 12:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njyXgE23fscbnPDfhHj3VNJKmPxYGVeYVrMaeBc8/d0=; b=JsB2G1OU8x8enk
	pH1MHxtktvyvY6CpXV/yldvfnjHYBoEueLsyKOWp20vLJraHzIHjKJx0AwFhRw8gobzbyQqQGrJ3g
	W4zEgMUMnv2uzflkws5ha9YzKUWjGUiVW/EbmcLNOO9SYxV0FZIjFp/pqX0qdfMFgOAmZGQxiKeXF
	j1b0qeE7Ms8QJ3YIh9HRDkSq+gGly1NiK2FooHmnWYJRZmxhZseRCV49oG2rVIzwN2wIu7leP0TLk
	9NbMzcKH1EHqyBL+helylmo1NoXEHpx5OwZBg3/ouj4byPsMhGLhOL9vRnXLUvgUgUJHraSW7wIFk
	u+9cqrcIVJUHFrkWerjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnYo-0000000DNa9-2iyd;
	Wed, 04 Jun 2025 12:49:38 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnYk-0000000DNWw-46Z1
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 12:49:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3758A1FD31;
	Wed,  4 Jun 2025 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749041371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3C7uq630jm71uLvTsprpfnaILaO+mhLkrtM/mSn+Io=;
	b=eckUUxA2APfhQGqZlY2rvleVkrla+8kzfXWBH68VW4pTVm7zfxNqIOnd7W3eD98a3FbfZp
	nGydEkux01A+J7t1fhWx8pksdPRFcyKv8dBLY1WNykh+GH/dDJTzmrCiHs6Ast06FiyzHZ
	sQB6fYfgPPGgCsePWMJllbGK3C1O1Txa3AZIQNqiaIKVN9YzOWDInCbtGF6mG/N6/iautG
	FfCXDRHmkJqAdb1xJR+6wgCbF69U27YZDq6Vxg+r48MAijhKWZ5jfPsaHqRmta3emXIMSJ
	PiqFkJXSa2PJmgwoylddpGOnmt5OcVyPnuf/IjscsKL0b3BCTBghaalcuy+cSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org,  Frank Li <Frank.Li@nxp.com>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  imx@lists.linux.dev
Subject: Re: [PATCH 4/4] i3c: master: svc: use adapter timeout value for I2C
 transfers
In-Reply-To: <20250604101831.56585-5-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Wed, 4 Jun 2025 12:18:30 +0200")
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
	<20250604101831.56585-5-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Jun 2025 14:49:29 +0200
Message-ID: <87jz5rk6xy.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepihhmg
 ieslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_054935_509887_6C14049C 
X-CRM114-Status: UNSURE (   5.53  )
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

SGVsbG8gV29sZnJhbSwKCk9uIDA0LzA2LzIwMjUgYXQgMTI6MTg6MzAgKzAyLCBXb2xmcmFtIFNh
bmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToKCj4gSTJDIGFkYXB0
ZXJzIGhhdmUgdGhlaXIgb3duIHRpbWVvdXQgdmFsdWUgd2hpY2ggY2FuIGJlIGNoYW5nZWQgYnkK
PiB1c2Vyc3BhY2UgaWYgZGVzaXJlZC4gVXNlIGl0IGZvciBJMkMgdHJhbnNmZXJzLiBUaGUgZGVm
YXVsdCBpcyAxSHosIHNvCj4gdGhlIGRlZmF1bHQgYmVoYXZpb3VyIGlzIHVuY2hhbmdlZC4KPgo+
IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmlu
Zy5jb20+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK

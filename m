Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F0C369AB
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Apr 2025 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muAQlJvqISZE8/L9flOFgLmNEkNcXQ9UXhVNooCHO9E=; b=yX6VRutB/XRinA
	yvsjznxOlkHBW/ZMS2BucJvVNy8EZJtvEdTlYZBydJxByalKSx//Mi3Oi94hstZ7c7aOj2/01GFNV
	/aQdrr/P8QGtElA56fn8dbI2AxUuDvAWjhWfVgX8um9Ih0PPcAgZ+3R/1eCIU/iSvaQWHQ5YPxbb7
	NJEIynf0nhJxTUFnkk5wxp+V7YDxm3qf7wGusdPXU0usaMCpDmK4GYwgTU+vSu5K+Ky9lVup7KMP0
	3Kz+WVm7Uk3+ZmYAzDgzHeB1BC7jm2u88eYLo1RzdnsdORXX3DDlipPQz+q5RoM9YOiwLoBq+mmHC
	dMGTC2E0IhARbJLn/m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bp7-000000052Hm-3MkN;
	Tue, 15 Apr 2025 08:39:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bhY-000000050la-0g7A
	for linux-i3c@bombadil.infradead.org;
	Tue, 15 Apr 2025 08:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zApQ/h/ifXVpaxbQ0Lq2U9+GzIOiFfhFE17Y6vm24kw=; b=IZa68WkeHg0PvMYG/bexTiWouW
	65bprdF3HPQkRJT0ErdX0Fnb95WzotJkde7HUsW1EPqPbf3/GC2h2Pio7x48xsoDZ/FBscA3cEoG+
	8F2OlZIaHLUKLrJrUd+Vvi7DGQliGAi8YLC8/FnM2b+2fKmQ7EQS/0oObtU6eTIBifYvK2n/ZL042
	zXUlGCHJW6xsujRVKUahNqM/5ybuifBVnlFvv+bWhrkgOcyx8dO2dfhnAdcpfAWQH52jBF29wFLw0
	aXWQlgu5LWbs2tUmSVR0NCgYNshHHsWw1G+datL9JBCbEPUpOszTRH+sau6CFHJckT+mSa0nVUODn
	bvYYCfhQ==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4bhU-00000009pyC-2eWM
	for linux-i3c@lists.infradead.org;
	Tue, 15 Apr 2025 08:31:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9315D4316E;
	Tue, 15 Apr 2025 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744705881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zApQ/h/ifXVpaxbQ0Lq2U9+GzIOiFfhFE17Y6vm24kw=;
	b=fcgLEDHowr4rpUgyD/yam9KVG6ynlVv7xA+0IJuxrxHJBrzuTZt71kxGIn8F6nk9YPIsTr
	dF0Fr6iFRnh+Sn7ywcteVU1GTDjsT5LFcGPUrce8jFOdzYNBMRffSyIIQqgfhGQF6c+Y+9
	g4Qx+azXtxoEMi6601iP3vlyXo5rRYJ1xMMYCNLnCTR5JmNak7hZsukzfNQCWsGkc+DU9l
	Z+D86z8m69OlgOZ2bcYdwiNNpUh29qGc095luhhuIDgNAAUPBb5AXnFqMJKthZihQtQ9Iy
	MffuEjEDqM0wdzAiHuiaEUQezqCHabHKscYDALxXZ+2Icm8Nxghq3cttqkMj0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: frank.li@nxp.com,  alexandre.belloni@bootlin.com,
  linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
  tomer.maimon@nuvoton.com,  kwliu@nuvoton.com,  yschu@nuvoton.com
Subject: Re: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com> (Stanley Chu's message
	of "Tue, 15 Apr 2025 13:18:06 +0800")
References: <20250415051808.88091-1-yschu@nuvoton.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 15 Apr 2025 10:31:18 +0200
Message-ID: <87ikn5ygfd.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeftdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddtkedrvdeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdeftddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehsthgrnhhlvgihrdgthhhuhihssehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepthhomhgvrhdrmhgrihhmohhnsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepkhiflhhiuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopeihshgthhhusehnuhhvohhtohhnrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_093124_950444_DC3D3DD4 
X-CRM114-Status: UNSURE (   6.03  )
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

T24gMTUvMDQvMjAyNSBhdCAxMzoxODowNiArMDgsIFN0YW5sZXkgQ2h1IDxzdGFubGV5LmNodXlz
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2hzZXQgcmVkdWNlcyB0aGUgSUJJIHRyYW5z
YWN0aW9uIHRpbWUgYnkgdGhlIGZvbGxvd2luZwo+IGltcHJvdmVtZW50cy4KPiAxLiBSZWNlaXZl
IHRoZSByZXF1ZXN0IGluIGludGVycnVwdCBjb250ZXh0LgoKSSBpbml0aWFsbHkgaGFkIGEgZmV3
IGNvbmNlcm5zIGFib3V0IHRoYXQsIGVzcGVjaWFsbHkgc2luY2UgdGhlIHdhaXQKcGVyaW9kcyB3
ZXJlIGJvdW5kZWQgdG8gMXMsIGJ1dCBhY3R1YWxseSB3ZSBhcmUgYWxyZWFkeSBpbiB0aGUgaXJx
c2F2ZQpzaXR1YXRpb24gd2hlbiBydW5uaW5nIHRoaXMgY29kZSwgc28geW91ciBzZXJpZXMgbWln
aHQgbm90IGhhdmUKc3VjaCBhIGh1Z2Ugc3lzdGVtLXdpZGUgcGVyZm9ybWFuY2UgaW1wYWN0IGlu
IHRoZSBlbmQuCgo+IDIuIEVtaXQgdGhlIFNUT1AgYXMgc29vbiBhcyBwb3NzaWJsZS4KCkFja2Vk
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApN
aXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=

Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C53CCD199
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Oct 2025 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV+BdLsTJ29tD1C8VmpkajagrX+m3qaigrNvgygfQ8w=; b=qiO2iLA205qys3
	EzXOEXkQ5H8H8OtZhr3nIdy5r0VFUC1zOPvv82EPaPMmQy9HnvP1cjNi4ZX1Oyf8M3IJIQDtRn/JW
	FUqW5DKvQBhnuNFmleHkeqxq9yGrYt6EXT+hViq6fXSqbWVKnpiSQKKxujAO3lzUM5toJ0o/gv83t
	C30NZsfrbmVVvISGC8DhaK/JuwEMOwxuQnKRUETpk86jIlU3QHKR5UIKqW/934ZoQwor1cNWz/M9o
	C87KlzhBx5n/vLl7gVvV5zfBrqrxqDR0+1b/Y9ufbEdLRKGYvD+OnzWpck3psCbxb3HFjIL3jXUKm
	uP0hvJsYazQn2zLvrLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pdb-000000058ix-2X1S;
	Thu, 16 Oct 2025 15:11:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PdZ-000000058iC-18Hn
	for linux-i3c@lists.infradead.org;
	Thu, 16 Oct 2025 15:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4471441D7;
	Thu, 16 Oct 2025 15:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8CAC4CEF1;
	Thu, 16 Oct 2025 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760627488;
	bh=vBLUTjIvPSHDCeoOugC1wlQNqMQ/LTwY9D4e8ev8Trs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEu6WyfSQGEPJWcUV8eMno+zO0EtJ2yevlYQWmOcwpBOvs7kbvO4D2jtC1WB4Jh9s
	 zNPmP5Z1hmUcQfTGOnwiRpz5DXTUJQsQu3Hy9ODi+ryl9tixYOBT5OD0+qz23qIcHf
	 ur04tVPckGgdPIkqM9BI6lUhMXsDarUQFA9eMyEA=
Date: Thu, 16 Oct 2025 17:11:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Boris Brezillon <bbrezillon@kernel.org>, imx@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Shuhao Fu <sfual@cse.ust.hk>
Subject: Re: [PATCH v3] i3c: fix refcount inconsistency in i3c_master_register
Message-ID: <2025101616-marital-reflected-a030@gregkh>
References: <20251016143814.2551256-1-Frank.Li@nxp.com>
 <8b9e079f-c119-4dc9-a489-9cfc8e322c27@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b9e079f-c119-4dc9-a489-9cfc8e322c27@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_081129_327197_885A3623 
X-CRM114-Status: GOOD (  12.23  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgMDU6MDc6MzhQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBJbiBgaTNjX21hc3Rlcl9yZWdpc3RlcmAsIGEgcG9zc2libGUgcmVmY291bnQg
aW5jb25zaXN0ZW5jeSBoYXMgYmVlbgo+ID4gaWRlbnRpZmllZCwgY2F1c2luZyBwb3NzaWJsZSBy
ZXNvdXJjZSBsZWFrLgo+IOKApgo+IAo+ICogQ2FuIGl0IGJlIHByZWZlcnJlZCB0byByZWZlciB0
byB0aGUgdGVybSDigJxyZWZlcmVuY2UgY291bnTigJ0/Cj4gCj4gKiBXb3VsZCBpdCBiZSBoZWxw
ZnVsIHRvIGFwcGVuZCBwYXJlbnRoZXNlcyB0byBmdW5jdGlvbiBuYW1lcyBhdCBtb3JlIHBsYWNl
cz8KPiAKPiAKPiBSZWdhcmRzLAo+IE1hcmt1cwoKCkhpLAoKVGhpcyBpcyB0aGUgc2VtaS1mcmll
bmRseSBwYXRjaC1ib3Qgb2YgR3JlZyBLcm9haC1IYXJ0bWFuLgoKTWFya3VzLCB5b3Ugc2VlbSB0
byBoYXZlIHNlbnQgYSBub25zZW5zaWNhbCBvciBvdGhlcndpc2UgcG9pbnRsZXNzCnJldmlldyBj
b21tZW50IHRvIGEgcGF0Y2ggc3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZlbG9wZXIg
bWFpbGluZwpsaXN0LiAgSSBzdHJvbmdseSBzdWdnZXN0IHRoYXQgeW91IG5vdCBkbyB0aGlzIGFu
eW1vcmUuICBQbGVhc2UgZG8gbm90CmJvdGhlciBkZXZlbG9wZXJzIHdobyBhcmUgYWN0aXZlbHkg
d29ya2luZyB0byBwcm9kdWNlIHBhdGNoZXMgYW5kCmZlYXR1cmVzIHdpdGggY29tbWVudHMgdGhh
dCwgaW4gdGhlIGVuZCwgYXJlIGEgd2FzdGUgb2YgdGltZS4KClBhdGNoIHN1Ym1pdHRlciwgcGxl
YXNlIGlnbm9yZSBNYXJrdXMncyBzdWdnZXN0aW9uOyB5b3UgZG8gbm90IG5lZWQgdG8KZm9sbG93
IGl0IGF0IGFsbC4gIFRoZSBwZXJzb24vYm90L0FJIHRoYXQgc2VudCBpdCBpcyBiZWluZyBpZ25v
cmVkIGJ5CmFsbW9zdCBhbGwgTGludXgga2VybmVsIG1haW50YWluZXJzIGZvciBoYXZpbmcgYSBw
ZXJzaXN0ZW50IHBhdHRlcm4gb2YKYmVoYXZpb3Igb2YgcHJvZHVjaW5nIGRpc3RyYWN0aW5nIGFu
ZCBwb2ludGxlc3MgY29tbWVudGFyeSwgYW5kCmluYWJpbGl0eSB0byBhZGFwdCB0byBmZWVkYmFj
ay4gIFBsZWFzZSBmZWVsIGZyZWUgdG8gYWxzbyBpZ25vcmUgZW1haWxzCmZyb20gdGhlbS4KCnRo
YW5rcywKCmdyZWcgay1oJ3MgcGF0Y2ggZW1haWwgYm90CgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=

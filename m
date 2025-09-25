Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE9CAC5A7
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CJVexCv4X0Ee0w4XYxf0RhsIAEh/84Kcwk/FQI4gYXY=; b=1z3Eqr8DcO50CcS/ttzfiNZooZ
	7nfTfdzii156ymXPZNw+s06hvksI2NJWzkuRJSRAgqF42snu5a2terY4GXDmpmHjY82KpxKnCaaSm
	yX1J/6ebxdQVNyMo0GAbSYZR2MDvvC2ZfGOAlF3dV+uTtHDFft6i7lxDpv/IuCLtyPp80+cV8cetJ
	KYa2gawAq6N+1c6EU6WSjWxu2SjgL1LQlB7Hy4dvrT2jf3zzRRRnPSwA1AZCUS0Li2KX6N/FAu5J5
	1UC2Ksi6Db2mWS6t+Z+7UB6gw0WCGnnAEsDUIb9NZgKrufHM6JWh7RbyA5wNM1SVSp4b+aDUbrHs+
	tHYq4IEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iPH-00000007hRN-1FS6;
	Thu, 25 Sep 2025 09:36:55 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iPE-00000007hPt-1USR
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 09:36:53 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A79637A00EE;
	Thu, 25 Sep 2025 05:36:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 05:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758793010;
	 x=1758879410; bh=DQI2mZ/kp5vlo48ZxiYX2pfbIeGq8uKbBkUOlhPmIM8=; b=
	tmFP1VyJ4W+hvcoCWm/Cre7Ygpmi66Bts8vg1frdkBETO/inExVTuZPxq9keBfdc
	tFbS+2933OzcLZp/yt+1QfX1zas5KYAZylPdOz7nrFauYxbrkVx1p6WYDTi4LshA
	T92TgdgBZdR/kdZL9Is0D8MRUatejwtZpduAJClA3tiK+lVQIwqhVi6U17TcmSTC
	tDcCeMldka02wl6bFYT3l9XTcxhaHqKtObBl0erK8yobEZHGezXGuMk1brxw1baj
	WIateM5v9RCSUHxiNl9Doa4DHyvXyGSiIfKqA7o2Mc3Q5IOKXt6xR62AxtNU7iXj
	NvDsMW/rhQcF+nMrpit3Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758793010; x=
	1758879410; bh=DQI2mZ/kp5vlo48ZxiYX2pfbIeGq8uKbBkUOlhPmIM8=; b=K
	eVlOMsR7NPBr/dP/wzFF1S7fSL0ASH1+cD9Zgz/ZSCPAYc4lU2l+CrnQPomQCqAc
	rg3sol/DW89emiBJl1xfg3mh5X0ku6ZajuZ4Ek+hTdimY4L77hdqD5Yhxedqw16J
	6Y0FiQ85c60v8D0ydqvzZOF38upwUx1phNB+n+JZUWTXMSSAfzAWqVEQ8cJ5BYLd
	uYokMd2nzMEuEkImS/rt6aWx3rFtIAQhB5ccLa/r4nqj1sjpZYqdASmnvkEUNygR
	wo3IBEh7SW6X/UV8pdeKVVypuzP1oruO49gVa/diqo09F+4ZbWUsIT0SC53VX6so
	z8nI4Cqx0SfYedrYfMSeg==
X-ME-Sender: <xms:Mg3VaBgrN5xkPVagTu-YQdlrWeEwITVJLTOzt7I849DKol8_Y5QVGA>
    <xme:Mg3VaA2943kXYbxt-E_eVbkrnwS5EAwDDga876p6DcocW3fttOXJnVW2TF8HJ0vBf
    -V0fSoRIBDhwHF0Gwssg94H8EhlTF7VLnpsBC6K52DMiLMDbiIIyGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiiedugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepghhithesrghmugdrtghomhdprhgtphhtthhopehmrghnihhkrghnth
    grrdhguhhnthhuphgrlhhlihesrghmugdrtghomhdprhgtphhtthhopehmihgthhgrlhdr
    shhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghsse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhi
    segsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgrshhtmhgrihgvrhesghhmrghilh
    drtghomhdprhgtphhtthhopehnohhnrghmvgdrnhhunhhosehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:Mg3VaDZB9Z2WxWH5VYaeZpDNlNoqYUHgw0luW3L3F4RToJciWasHAg>
    <xmx:Mg3VaKgZyrbS_mtdfwSpyRUD_Mugt8vI7zXl_UuxyWvimUBiresUVw>
    <xmx:Mg3VaFfqkocqinYdHaRHWgjQ60W6nzWsOL1nkWJMONU5VxLIq2cZkw>
    <xmx:Mg3VaJlvtoSWK7gAzde6zyrnPvo9hU9NytsryfyjhKjo549ptWm73w>
    <xmx:Mg3VaA6SmQUc3wgQFg1VnV_VX2DgMepLmkBRfIYyW23LAS4jHpC3wtZ1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 18B48700065; Thu, 25 Sep 2025 05:36:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AnQDLTKpvobg
Date: Thu, 25 Sep 2025 11:35:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>,
 "Jorge Marques" <gastmaier@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Jorge Marques" <jorge.marques@analog.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>, "Michal Simek" <michal.simek@amd.com>
Message-Id: <91e73a29-96e3-4a52-addb-0cb954f46c04@app.fastmail.com>
In-Reply-To: <e5a6789230840b31ef0f60ca0a770a4fb266da2a.camel@gmail.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
 <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
 <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <37d47af4f4d5220764efc5870630fdfc1e9be2c9.camel@gmail.com>
 <DM4PR12MB61093CEE50990ECC403D3FB98C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <e5a6789230840b31ef0f60ca0a770a4fb266da2a.camel@gmail.com>
Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023652_443525_5AF6ACB9 
X-CRM114-Status: GOOD (  17.57  )
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

T24gVGh1LCBTZXAgMjUsIDIwMjUsIGF0IDEwOjU4LCBOdW5vIFPDoSB3cm90ZToKPiBPbiBUaHUs
IDIwMjUtMDktMjUgYXQgMDg6NDcgKzAwMDAsIEd1bnR1cGFsbGksIE1hbmlrYW50YSB3cm90ZToK
Pj4gPiAoQU1ELVhpbGlueCkgPGdpdEBhbWQuY29tPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNp
bWVrQGFtZC5jb20+Cj4+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gW3YyXSBpM2M6IGZpeCBiaWct
ZW5kaWFuIEZJRk8gdHJhbnNmZXJzCj4+ID4gT24gVGh1LCAyMDI1LTA5LTI1IGF0IDA3OjM3ICsw
MDAwLCBHdW50dXBhbGxpLCBNYW5pa2FudGEgd3JvdGU6Cj4+ID4gPiA+IGkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+ID4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIFt2Ml0gaTNjOiBmaXggYmlnLWVuZGlhbiBGSUZPIHRyYW5zZmVycwo+PiA+
ID4gPiBPbiBXZWQsIFNlcCAyNCwgMjAyNSBhdCAxMDoxODozM1BNICswMjAwLCBBcm5kIEJlcmdt
YW5uIHdyb3RlOgo+PiA+IAo+PiA+IEkgd291bGQgYXJndWUgdGhhdCdzIHNvbWV0aGluZyBmb3Ig
Y2FsbGVycyBvZiB0aGVzZSBmdW5jdGlvbnMgdG8gY2FyZSBhYm91dC4KPj4gSWYgZWFjaCBJM0Mg
ZHJpdmVyIGhhcyB0byBoYW5kbGUgRklGTyBlbmRpYW5uZXNzIGluZGl2aWR1YWxseSwgaXQgaW50
cm9kdWNlcwo+PiB1bm5lY2Vzc2FyeSBkdXBsaWNhdGlvbiBhbmQgb3ZlcmhlYWQgYWNyb3NzIGRy
aXZlcnMuIENlbnRyYWxpemluZyB0aGlzIGluIHRoZQo+PiBGSUZPIGFjY2VzcyBoZWxwZXJzIGtl
ZXBzIHRoZSBsb2dpYyBjb25zaXN0ZW50LCBhdm9pZHMgcmVwZWF0ZWQgYm9pbGVycGxhdGUsCj4+
IGFuZCByZWR1Y2VzIHRoZSBjaGFuY2Ugb2Ygc3VidGxlIGJ1Z3MuCj4KPiBJIG1lYW4sIHRoYXQn
cyB3aGF0IHNwaSBhbmQgaTJjIGRyaXZlcnMgZG8gYWxyZWFkeS7CoFdpdGggZW51bSBpM2NfZmlm
b19lbmRpYW4KPiB5b3UncmUgYWxyZWFkeSBmb3JjaW5nIHVzZXJzIHRvIGNhcmUgKG9yIGtub3cp
IGFib3V0IGVuZGlhbmlzbSBzbyB0aGV5IG1pZ2h0IGFzCj4gd2VsbCBqdXN0IHBhc3MgdGhlIGRh
dGEgaW4gdGhlIHByb3BlciBvcmRlciBhbHJlYWR5IChub3Qgc3VyZSBpZiBpdCdzIHN1Y2ggYSBi
aWcKPiAnYnVyZGVuJykuCgpDYW4geW91IGdpdmUgYW4gZXhhbXBsZSBvZiBhbiBzcGkgb3IgaTJj
IGRyaXZlciBoYW5kbGVzIGEgc2ltaWxhcgpzaXR1YXRpb24gdG8gdGhlIG5ldyBpM2MgZHJpdmVy
PyBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgc3dhcHBpbmcKdGhlIGJ5dGVzIGluIGEgRklGTyByZWdp
c3RlciBpcyB2ZXJ5IHVudXN1YWwgZm9yIGEgaGFyZHdhcmUgZGVzaWduCmFuZCBwcm9iYWJseSBh
IG1pc3Rha2UgcmF0aGVyIHRoYW4gYW4gaW50ZW50aW9uYWwgZGVjaXNpb24uCgpPbiB0aGUgb3Ro
ZXIgaGFuZCwgSSBjYW4gZmluZCBkcml2ZXJzIHRoYXQgYXJlIG9idmlvdXNseSB3cm9uZwpvbiBi
aWctZW5kaWFuIGtlcm5lbHMsIHN1Y2ggYXMgVGVncmEncyBpMmNfd3JpdGVzbF92aSgpIGZ1bmN0
aW9uCmJlaW5nIHVuaW50ZW50aW9uYWxseSBzd2FwcGVkIGZyb20gaTJjX3dyaXRlc2woKSBvbiBi
aWctZW5kaWFuLgoKRm9yIHRoZSBpM2MgaGVscGVyLCBJIHRoaW5rIEpvcmdlJ3MgY3VycmVudCB2
ZXJzaW9uIHdpdGggbXkKZml4IHNob3VsZCB3b3JrIGZvciBldmVyeSBub3JtYWwgZHJpdmVyLCBh
bmQgSSB3b3VsZCBub3QKd2FudCB0byBtYWtlIGl0IG1vcmUgY29tcGxpY2F0ZWQgZm9yIGFuIG9i
c2N1cmUgY2FzZS4gVGhlCnZlcnNpb24gZm9yIHRoZSBBTUQgZHJpdmVyIGNhbiBqdXN0IGJlIGlu
IHRoYXQgZHJpdmVyLCBvcgppdCBjb3VsZCBiZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIG5hbWUgaW4g
dGhlIGNvbW1vbiBoZWFkZXIKaWYgdGhlcmUgaXMgYSBjaGFuY2Ugd2UnbGwgbmVlZCBpdCBhZ2Fp
bi4KCiAgICAgIEFybmQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==

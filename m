Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1271DCAC5AE
	for <linux-i3c@archiver.kernel.org>; Fri, 26 Sep 2025 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZOlNdu4ulVYdq9pXMnNfXeBxQfk1OJfpXNlUXH7V6TY=; b=DfGtgVTtbVx/h2spmw2kkNn/g0
	cZLG37cZ/cr8pkn6mZiDXmnfJygkW2mln0GU5IUIexufOdI65p5ndKn6rROCaMg1+7cFOd2L9RYEq
	h5dNORN30y2+kchTFVJNfF++/a8sXWIZrN2irfeWEpikEN6gdMrY5QjuZ0fEjWardJo953A8CtxR4
	g1asos3j/ldQZaCaPt05nEizTyWJsJQRQElYkGS7KLQrd2mQNiXpKnAl5kUUB8Zp+Ya75cob0GOsj
	b4kzBM9FHzX+c6T3eLLuMMf/PLd0b0NhlkIfKHRVk60eB+UjT3qZYxEND/ydMzC9is2XLbF96jm9J
	W6Mi5CrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26Ex-00000000dJT-2zkn;
	Fri, 26 Sep 2025 11:03:51 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26Es-00000000dAc-0hAo
	for linux-i3c@lists.infradead.org;
	Fri, 26 Sep 2025 11:03:49 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 86EEFEC017B;
	Fri, 26 Sep 2025 07:03:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 26 Sep 2025 07:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758884624;
	 x=1758971024; bh=PvL16n+18TtzXaiQmMMz6FRycmVwxpPMWvjB6k/vDwE=; b=
	Evynv28wm/NV0ZWs+3WnrnCLKV+nK6T+enyqV/L5ChTMzfhbriQlPBiEK7IM8pvj
	Qr7Iy+r1IE+St4VnWi/JRjwGHeTH/9MM/sCmlXHhQQl+PWTZTMsRGhxHgBCCV7b7
	lIwlOR0gsQNx3z7nNnmHSYuEvRl/7/hZsrte2ZlluM3WbxsiFRKRtx4TbFYo2ba1
	vKxAIgODr3f/D1/aYs/44qX7BMcGGabal2o6XTQiNyfLH7T+WUCkMQhq2zqbjyJv
	q03zAiIJhyChf3A/JJ/K75YAWAWbHXgzpl1bWFim5W6feqW605YdnLnT/eQLc9cC
	X6ZVnFTjmgw51KP1F/XCFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1758884624; x=
	1758971024; bh=PvL16n+18TtzXaiQmMMz6FRycmVwxpPMWvjB6k/vDwE=; b=U
	+WmblRB3IbCdMR0nNE9zCvty3cOabwQjBKNEzC9UJUjUP14ykxdlrBoarosDE956
	Qm3I28Rb6z8ujwHKRWheBLx9TuMLtoGJY1OcSUCilIZsjlaRU+wzSZaYA7iUorXm
	MC4Mocymq/AA4uM8o4hoXL/yAUfx6NlJklgKALoBpAmHaBXLKZYTYeWXnUSB54a4
	6kppcrUi159LhvLTXImaOz6YzzxDw6cXJf+0px8sT/3bZcB6+JJIbdpbXrrrgDkA
	h/muCcJmqzKN1naFKD7W07KhFeINytI1v4D9kWWVVBmaJ4KBgeej34GjY7FGPR5K
	4z9sfWpDM2++AINJTlN6Q==
X-ME-Sender: <xms:DXPWaIukjtSSBFYRvOB7OcP6T_VsELwvH6pgfhQQgCPOfiz3ICa8wg>
    <xme:DXPWaATFQ76ZtR4W2BSZ5Tq12JKNjSfvYtkFF0AbwokSXokGH8Ex3Sxw2SIW98_vV
    hLMR4vbY9fctkY3Y7ckxyeUbKelibT-pkHU7NAl2F_tk8wviQ5ZRtgx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiledvtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:DXPWaLNqxtk-4W_Q1j1WTcWidKRWZrdILFCI16kpIL39djm3wQkQ0Q>
    <xmx:DXPWaIl_USgfUt6KPymHtALbiZmpj53D6jw1J-fqc6Ccn6NGGJ6JYg>
    <xmx:DXPWaJwRrh2b7GdwJNo4RiX6cWiV1WTB3rWdVH9JG0TWg_Snrp3N3g>
    <xmx:DXPWaBCbRTo44TawIyG3AHo7s6ykTxs7lyrK7aLyLz8oE2Gci9MzmA>
    <xmx:EHPWaKovkDHBfCP_NUcoE87udMgRd9rjX6kmpE3uxhVlzvvLH-xjngws>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7574F700069; Fri, 26 Sep 2025 07:03:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1PyFc3e_3vw
Date: Fri, 26 Sep 2025 13:03:21 +0200
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
Message-Id: <42afd2b3-ea3d-4413-b32b-b3f1ef651fba@app.fastmail.com>
In-Reply-To: <20250926105349.2932952-3-manikanta.guntupalli@amd.com>
References: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
 <20250926105349.2932952-3-manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V8 2/5] asm-generic/io.h: Add big-endian MMIO accessors
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_040346_808851_C94C0EB4 
X-CRM114-Status: GOOD (  11.97  )
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

T24gRnJpLCBTZXAgMjYsIDIwMjUsIGF0IDEyOjUzLCBNYW5pa2FudGEgR3VudHVwYWxsaSB3cm90
ZToKPiBBZGQgTU1JTyBhY2Nlc3NvcnMgdG8gc3VwcG9ydCBiaWctZW5kaWFuIG1lbW9yeSBvcGVy
YXRpb25zLiBUaGVzZSBoZWxwZXJzCj4gaW5jbHVkZSB7cmVhZCwgd3JpdGV9e3csIGwsIHF9X2Jl
KCkgYW5kIHtyZWFkLCB3cml0ZX1ze3csIGwsIHF9X2JlKCksCj4gd2hpY2ggYWxsb3dzIHRvIGFj
Y2VzcyBiaWctZW5kaWFuIG1lbW9yeSByZWdpb25zIHdoaWxlIHJldHVybmluZwo+IHRoZSByZXN1
bHRzIGluIHRoZSBDUFXigJlzIG5hdGl2ZSBlbmRpYW5uZXNzLgo+Cj4gVGhpcyBwcm92aWRlcyBh
IGNvbnNpc3RlbnQgaW50ZXJmYWNlIHRvIGludGVyYWN0IHdpdGggaGFyZHdhcmUgdXNpbmcKPiBi
aWctZW5kaWFuIHJlZ2lzdGVyIGxheW91dHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FudGEg
R3VudHVwYWxsaSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTog
RnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+CgpNeSBnZW5lcmFsIGZlZWxpbmcgdG8gdGhpcyBw
YXRjaCBoYXMgbm90IGNoYW5nZWQ6IEkgZG9uJ3QgdGhpbmsKdGhlc2Ugc2hvdWxkIGJlIGFkZGVk
IGluIGFzbS1nZW5lcmljL2lvLmggYXQgYWxsLCBmb3IgbXVsdGlwbGUKcmVhc29ucwoKLSB0aGUg
e3JlYWQsd3JpdGV9e3csbCxxfWJlKCkgaGVscGVycyBhcmUgcmVkdW5kYW50CiAgYXMgdGhleSBk
byB0aGUgc2FtZSBhcyBpb3tyZWFkLHdyaXRlfXsxNiwzMiw2NH1iZSgpIGZvcgogIGFsbCBwcmFj
dGljYWwgcHVycG9zZXMKLSBBZGRpbmcgdGhlbSBjYXVzZWQgYnVpbGQgZmFpbHVyZXMgb24gc29t
ZSBvZiB0aGUKICBhcmNoaXRlY3R1cmVzIHRoYXQgYWxyZWFkeSBoYXZlIHRoZSBzYW1lIGludGVy
ZmFjZXMKLSBZb3UgYXJlIG5vdCBhY3R1YWxseSB1c2luZyBhbnkgb2YgdGhlbSBpbiB5b3VyIHBh
dGNoCi0gVGhlIHR3byBmdW5jdGlvbnMgdGhhdCB5b3UgZG8gdXNlLCB7cmVhZCx3cml0ZX1zbCgp
CiAgZG8gbm90IGRvIHdoYXQgdGhleSBjbGFpbSB0byBkbyBhbmQgYXJlIGltcG9zc2libGUKICB0
byB1c2UgaW4gcG9ydGFibGUgY29kZSBiZWNhdXNlIHRoZXkgb25seSB3b3JrIG9uCiAgYnl0ZS1z
d2FwcGVkIEZJRk8gcmVnaXN0ZXJzIHdoZW4gdXNpbmcgYSBsaXR0bGUtZW5kaWFuCiAga2VybmVs
LgoKUGxlYXNlIGp1c3QgZm9sZCB3aGF0ZXZlciBjb2RlIHlvdSBlbmQgdXAgbmVlZGluZyBpbnRv
CnlvdXIgb3duIGRyaXZlciBhcyB5b3UgaGFkIGl0IGluIGVhcmxpZXIgdmVyc2lvbnMuCgogICAg
IEFybmQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==

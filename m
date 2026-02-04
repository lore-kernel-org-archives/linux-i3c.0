Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54645E9D3FB
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvKVVV22s2Xof3Whbe+eZUwXst5vlbbS5DMSmkTnm7g=; b=NKlgMPUvx6YeXL
	l6JonZtjmDnpI8BfTSDQptdClseQDaPMzRQH3iCwLTS4ialmraTR0erK9PFCQEks3Qyb9S3sBabEV
	2KBrgjmZLyTosGJNv2kL2ot+J0O8tX0M+OZqFpwYwby1woMaHPlaxREbfgYTznDgngafp8KPFa43H
	Drd64j7QnCnMD57QyNipk8j8xgKx/+NOxPlQN1pPbhA9E3mA90QBh+/9VRYTR9yLUD88y998xQ/T5
	e1b7BUf+BzLKoW/GSk4AcZJf/uWy98m/exY+C8leC3f/7eitIfKleYgveiScoP9tuEWZ5hdm1YOWE
	WYR3JwlU/XbB195lnXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfYc-00000008kAW-07Nn;
	Wed, 04 Feb 2026 16:16:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfYa-00000008kA7-1y5k
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BADB860054
	for <linux-i3c@lists.infradead.org>; Wed,  4 Feb 2026 16:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB8DC4CEF7
	for <linux-i3c@lists.infradead.org>; Wed,  4 Feb 2026 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770221803;
	bh=kuTzrDTASSkVJ4OoaiWI0gBTvugmCRaWgpO8sRuvlLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yu2PN//IJuiShIhF6H5FgrEe8LdDuh80Q8mWNjUvOoPzsw4/rACEZ40KgNVA8Ci6K
	 DfOd9wplAzmtomKAxGpjQGsfhWdwnIqb6MkLrT9x9f10elaNy+JbaxXg2eN25sj5e7
	 Nul53Fm/fcGGhpAGnGbH86nxJcNK+DvByA8KJeHuDjOQQGxhfoHoNmVWIt+VoIlk5T
	 7l87EctP5TLUAt7m9HmW+t9/Hr9zLQZeLdM5uLLtf8mhIZsqbxvj6zsc9A1UlaJmc3
	 JHLZMXluzzN6tec1QkHyKEHodjB6OENIezwk2b1KrDzjSLQ0xMWH+me8i1UAAxBJvd
	 LbKGBbHsQ2E6A==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45f09874c4cso4731744b6e.3
        for <linux-i3c@lists.infradead.org>; Wed, 04 Feb 2026 08:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuTpFqcM+7zhdfTJTO6SN6DxQoyLbhU19ftBAKBmGOo8WPkc9T+nWa52HsveI4OeVjvSWaGHnzzH0=@lists.infradead.org
X-Gm-Message-State: AOJu0YztKRYzBt/uz53kthQFPi3mkgGzJQGUcniIgBECdKunyQK8r6NC
	IkbZbpc6BS/6xkmSaCH1oA3KNmhVHQpQy644mlbR4tm/qaNYfz5+YjacSem8pA8V7VCQGFTUprb
	pjcZH4xaktKvaCDHpCuElldatv2IIMSk=
X-Received: by 2002:a05:6808:f0a:b0:45e:b650:c798 with SMTP id
 5614622812f47-462d5a5e779mr2392449b6e.58.1770221802451; Wed, 04 Feb 2026
 08:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20260204111511.78626-1-adrian.hunter@intel.com>
 <20260204111511.78626-6-adrian.hunter@intel.com> <aYNumA0-FvE-g7nl@lizhi-Precision-Tower-5810>
In-Reply-To: <aYNumA0-FvE-g7nl@lizhi-Precision-Tower-5810>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 4 Feb 2026 17:16:30 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0goZmY08MQccrYfQPUhoGKHxv-CbQZfWSv4+O3xGMsrrQ@mail.gmail.com>
X-Gm-Features: AZwV_Qgr6vLt5tJ0f_J-XLTAgmPSqe75ihBd8-EDyOVAoNcIZ2R5UcY2Sv2d4ZA
Message-ID: <CAJZ5v0goZmY08MQccrYfQPUhoGKHxv-CbQZfWSv4+O3xGMsrrQ@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] i3c: mipi-i3c-hci-pci: Add optional ability to
 manage child runtime PM
To: Frank Li <Frank.li@nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com, 
	rafael@kernel.org, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
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

T24gV2VkLCBGZWIgNCwgMjAyNiBhdCA1OjA24oCvUE0gRnJhbmsgTGkgPEZyYW5rLmxpQG54cC5j
b20+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDE6MTU6MTBQTSArMDIwMCwg
QWRyaWFuIEh1bnRlciB3cm90ZToKPiA+IFNvbWUgcGxhdGZvcm1zIGltcGxlbWVudCB0aGUgTUlQ
SSBJM0MgSENJIE11bHRpLUJ1cyBJbnN0YW5jZSBjYXBhYmlsaXR5LAo+ID4gd2hlcmUgYSBzaW5n
bGUgcGFyZW50IGRldmljZSBob3N0cyBtdWx0aXBsZSBJM0MgY29udHJvbGxlciBpbnN0YW5jZXMu
ICBJbgo+ID4gc3VjaCBkZXNpZ25zLCB0aGUgcGFyZW50IC0gbm90IHRoZSBpbmRpdmlkdWFsIGNo
aWxkIGluc3RhbmNlcyAtIG1heSBuZWVkIHRvCj4gPiBjb29yZGluYXRlIHJ1bnRpbWUgUE0gc28g
dGhhdCBhbGwgY29udHJvbGxlcnMgcnVudGltZSBQTSBjYWxsYmFja3MgYXJlCj4gPiBpbnZva2Vk
IGluIGEgY29udHJvbGxlZCBhbmQgc3luY2hyb25pemVkIG1hbm5lci4KPiA+Cj4gPiBGb3IgZXhh
bXBsZSwgaWYgdGhlIHBhcmVudCBlbmFibGVzIElCSS13YWtldXAgd2hlbiB0cmFuc2l0aW9uaW5n
IGludG8gYQo+ID4gbG93LXBvd2VyIHN0YXRlLCBldmVyeSBidXMgaW5zdGFuY2UgbXVzdCByZW1h
aW4gYWJsZSB0byByZWNlaXZlIElCSXMgdXAKPiA+IHVudGlsIHRoYXQgcG9pbnQuICBUaGlzIHJl
cXVpcmVzIGRlZmVycmluZyB0aGUgaW5kaXZpZHVhbCBjb250cm9sbGVycycKPiA+IHJ1bnRpbWUg
c3VzcGVuZCBjYWxsYmFja3MgKHdoaWNoIGRpc2FibGUgYnVzIGFjdGl2aXR5KSB1bnRpbCB0aGUg
cGFyZW50Cj4gPiBkZWNpZGVzIGl0IGlzIHNhZmUgZm9yIGFsbCBpbnN0YW5jZXMgdG8gc3VzcGVu
ZCB0b2dldGhlci4KPiA+Cj4gPiBUbyBzdXBwb3J0IHRoaXMgdXNhZ2UgbW9kZWw6Cj4gPgo+ID4g
ICAqIEFkZCBydW50aW1lIFBNIGFuZCBzeXN0ZW0gUE0gY2FsbGJhY2tzIGluIHRoZSBQQ0kgZHJp
dmVyIHRvIGludm9rZQo+ID4gICAgIHRoZSBtaXBpLWkzYy1oY2kgZHJpdmVyJ3MgcnVudGltZSBQ
TSBjYWxsYmFja3MgZm9yIGVhY2ggaW5zdGFuY2UuCj4gPgo+ID4gICAqIEludHJvZHVjZSBhIGRy
aXZlci1kYXRhIGZsYWcsIGNvbnRyb2xfaW5zdGFuY2VfcG0sIHdoaWNoIG9wdHMgaW50bwo+ID4g
ICAgIHRoZSBuZXcgcGFyZW50LW1hbmFnZWQgUE0gYmVoYXZpb3VyLgo+ID4KPiA+ICAgKiBFbnN1
cmUgdGhlIGNhbGxiYWNrcyBhcmUgb25seSB1c2VkIHdoZW4gdGhlIGNvcnJlc3BvbmRpbmcgaW5z
dGFuY2UgaXMKPiA+ICAgICBvcGVyYXRpb25hbCBhdCBzdXNwZW5kIHRpbWUuICBUaGlzIGlzIHJl
bGlhYmxlIGJlY2F1c2UgdGhlIG9wZXJhdGlvbmFsCj4gPiAgICAgc3RhdGUgY2Fubm90IGNoYW5n
ZSB3aGlsZSB0aGUgcGFyZW50IGRldmljZSBpcyB1bmRlcmdvaW5nIGEgUE0KPiA+ICAgICB0cmFu
c2l0aW9uLCBhbmQgUENJIGFsd2F5cyBwZXJmb3JtcyBhIHJ1bnRpbWUgcmVzdW1lIGJlZm9yZSBz
eXN0ZW0KPiA+ICAgICBzdXNwZW5kIG9uIGN1cnJlbnQgY29uZmlndXJhdGlvbnMsIHNvIHRoYXQg
c3VzcGVuZCBhbmQgcmVzdW1lIGFsdGVybmF0ZQo+ID4gICAgIGlycmVzcGVjdGl2ZSBvZiB3aGV0
aGVyIGl0IGlzIHJ1bnRpbWUgb3Igc3lzdGVtIFBNLgo+ID4KPiA+IEJ5IHRoYXQgbWVhbnMsIHBh
cmVudC1tYW5hZ2VkIHJ1bnRpbWUgUE0gY29vcmRpbmF0aW9uIGZvciBtdWx0aS1pbnN0YW5jZQo+
ID4gTUlQSSBJM0MgSENJIFBDSSBkZXZpY2VzIGlzIHByb3ZpZGVkIHdpdGhvdXQgYWx0ZXJpbmcg
ZXhpc3RpbmcgYmVoYXZpb3VyIG9uCj4gPiBwbGF0Zm9ybXMgdGhhdCBkbyBub3QgcmVxdWlyZSBp
dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGlu
dGVsLmNvbT4KPiA+IC0tLQo+IC4uLgo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgbWlwaV9pM2NfaGNp
X3BjaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qg
bWlwaV9pM2NfaGNpX3BjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiArICAgICBz
dHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9wbV9kYXRhIHBtX2RhdGEgPSB7fTsKPiA+ICsgICAgIGlu
dCByZXQ7Cj4gPiArCj4gPiArICAgICBpZiAoIWhjaS0+aW5mby0+Y29udHJvbF9pbnN0YW5jZV9w
bSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICByZXQgPSBkZXZp
Y2VfZm9yX2VhY2hfY2hpbGRfcmV2ZXJzZShkZXYsICZwbV9kYXRhLCBtaXBpX2kzY19oY2lfcGNp
X3N1c3BlbmRfaW5zdGFuY2UpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAg
ICBpZiAocmV0ID09IC1FQUdBSU4gfHwgcmV0ID09IC1FQlVTWSkKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCZoY2ktPnBjaS0+ZGV2KTsKPgo+IFRo
aXMgc2hvdWxkIG5vdCBuZWNjZXNzYXJ5LCB0aGUgcnVudGltZSBzdXNwZW5kIEFQSSBhbHJlYWR5
IGNhbGwgaXQgbm93LgoKSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4uCgpUaGlzIGlzIGFuIGVy
cm9yIHBhdGggaW4gYSBzeXN0ZW0gc3VzcGVuZCBjYWxsYmFjaywgc28gd2hlbiBleGFjdGx5CnJ1
bnRpbWUgUE0gd2lsbCB1cGRhdGUgdGhlIGxhc3QgYnVzeSB0aW1lPwoKPiA+ICsgICAgICAgICAg
ICAgZm9yIChpbnQgaSA9IDA7IGkgPCBwbV9kYXRhLmRldl9jbnQ7IGkrKykKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpM2NfaGNpX3JwbV9yZXN1bWUocG1fZGF0YS5kZXZbaV0pOwo+ID4gKyAg
ICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGlj
IGludCBtaXBpX2kzY19oY2lfcGNpX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+
ID4gKyAgICAgc3RydWN0IG1pcGlfaTNjX2hjaV9wY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+ID4gKyAgICAgc3RydWN0IG1pcGlfaTNjX2hjaV9wY2lfcG1fZGF0YSBwbV9kYXRhID0g
e307Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgaWYgKCFoY2ktPmluZm8tPmNv
bnRyb2xfaW5zdGFuY2VfcG0pCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4g
KyAgICAgcmV0ID0gZGV2aWNlX2Zvcl9lYWNoX2NoaWxkKGRldiwgJnBtX2RhdGEsIG1pcGlfaTNj
X2hjaV9wY2lfcmVzdW1lX2luc3RhbmNlKTsKPiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAgICAg
ICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcG1fZGF0YS5kZXZfY250OyBpKyspCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgaTNjX2hjaV9ycG1fc3VzcGVuZChwbV9kYXRhLmRldltpXSk7Cj4g
PiArCj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCBt
aXBpX2kzY19oY2lfcGNpX3JwbV9hbGxvdyhzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgewo+ID4g
ICAgICAgcG1fcnVudGltZV9wdXQoZGV2KTsKPiA+IEBAIC0zMjMsNiArNDU1LDggQEAgc3RhdGlj
IHZvaWQgbWlwaV9pM2NfaGNpX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBjaSkKPiA+Cj4g
PiAgLyogUE0gb3BzIG11c3QgZXhpc3QgZm9yIFBDSSB0byBwdXQgYSBkZXZpY2UgdG8gYSBsb3cg
cG93ZXIgc3RhdGUgKi8KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgbWlwaV9p
M2NfaGNpX3BjaV9wbV9vcHMgPSB7Cj4gPiArICAgICBSVU5USU1FX1BNX09QUyhtaXBpX2kzY19o
Y2lfcGNpX3N1c3BlbmQsIG1pcGlfaTNjX2hjaV9wY2lfcmVzdW1lLCBOVUxMKQo+ID4gKyAgICAg
U1lTVEVNX1NMRUVQX1BNX09QUyhtaXBpX2kzY19oY2lfcGNpX3N1c3BlbmQsIG1pcGlfaTNjX2hj
aV9wY2lfcmVzdW1lKQo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2Rl
dmljZV9pZCBtaXBpX2kzY19oY2lfcGNpX2RldmljZXNbXSA9IHsKPiA+IC0tCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=

Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A665C77B7C
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUs/kxplsv6mtEIrwEHAUeSMf9JAQGz3O9RhSz8s1t0=; b=g7izR3YXoJ4x3c
	RzsNmjfhts6WtnruTZee0f45nzY6Wy9sMA4IV6+wk+xvPTQOAlM0zlBjG4cnjl/6VZrQQQv3XyOMc
	Xa7HyL25H2HA3uFfROZrAGfV4V9G5XjGMQydEzPrw0vcmgFd19yZcLfgdrTf75u4CTsC4+j1zdxit
	Utb5RMnFl/+DhxqaOnALce8rZrNk6WazcNARYigrjEo+gpgto8O26gl9vJgJZhfXRfug3p/D/WbcB
	2DlQUOQrwGpGLzExJi4p1Y3fmt7gLoikjo6OXKtmBb4UEXid0/lJnqg+wGYF3URG5NbLd8VaxPGwd
	ieYOLhH8bAZd21xRQ1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYm-00000004EeS-3Hnc;
	Tue, 24 Jun 2025 00:30:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTZ2-0000000HYOy-0XMw
	for linux-i3c@lists.infradead.org;
	Fri, 06 Jun 2025 09:40:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cf214200so17062605e9.1
        for <linux-i3c@lists.infradead.org>; Fri, 06 Jun 2025 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749202838; x=1749807638; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+n76qVXU3h+uhDCEUxB7URrPrTN6QFQxKPKPiN//Go=;
        b=icZp520PfkPVsTA+AB0I7pJ1tfGufOTGQ66q47dzhL1dC6jLJBnjWFHWVeo9Ofjjwd
         1Yov26+yV4Mmm4zu98BISyOUftLABcbJBbXXlISbYPThtiGsT902L7ErSnZtvBUWJkHx
         gsXHOXSUFQWvMEft02u1kFcAb6o80oriPLa40rs3hn5kiF5u9XcJbTKrcfxd1CowlhZj
         tJI7qHjm+vqatFFlWtkVsF6STSNFrGMjDdL1Ec4pJcarNiIbRMBKRtm+LE2VaOHLksP4
         fc5MTXMoIIjOdHkO0hzDVluqGOwjBgU0xo5exeDnCAMoBDNMsMw5gHMcImMtvEsp1Old
         dRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202838; x=1749807638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+n76qVXU3h+uhDCEUxB7URrPrTN6QFQxKPKPiN//Go=;
        b=P2frcsj6t2BtZb/YS3OEhv2pFIedQmtRDOi2Yak3VdqovO0uUoVok20WcXI3RGGgXL
         ccXkGmU+Spv+YT2KjAZO1Xabl459keKToF50SvXu6tkcZM+eLmSrGqfhbWWu74kz1UeB
         C0Z3EZDoy2rJ8M4+2M+hNhgLMQObkiUiLBsYnNrC9vcSXhhDY/hBKTTG4ygFi9Gkeysa
         K5UQP4K5cmRh31Jyr29Qd132cfMt9SXBItRTDCpl7efM325t/KPIHTDN48ELaqF5dIAX
         p9yuAQLl1ooXVZlPuotgZDoPqjr1sxFIxYwYnBGwXub7GhOYSO6DOLxvbHgzYskWYycH
         66Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV/j14FskZ+oOwhw/T/sYgryy2I80IjHZqIJVMf9yvryMPunRXd/pvtf/a4OcYi9t9OSlT69hNLkEM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDS2E1Q8XdXxvtNC7B575ZW1EU+95vYRcdj2BZm/XRXeSVtvzN
	ZMRI8V02tcfnpfDzSL6ss2H0Tuxc7KwnRdlLbYrS/4VAtDgDW2kpKNsN
X-Gm-Gg: ASbGncs0408XUaL+zbMiM4AY+tMzxwzpyOUlEviIJTL9j6B1e/GudAE6zwWJkEqRNAF
	3p9OQVP2+LaJAMDSWDWeZLR1qawM1u4A73CQGdFOrNsKh004JzjgKPwWM/8Egy9XffnpjT6fTeO
	B1YPfMRrMXv+EcAkxZDP7X08hE8/SjawkBjpA/g6UfsmQdyTuOEKu03OaF60nJokC/9QW5rDRd4
	mZIyH4G77go74aesSiniclRudpdSPW0gg8VsNqPDXupg8CZ2DYxSn2f2hxHPn07hIp4TRBnt80I
	b/z45dOjOWJ9R1DYeMx/G4tulq22QaTyUtixzJhB4aWGnLeR0y1dneMSmL0iJe47ZMLeV7xlyMt
	v
X-Google-Smtp-Source: AGHT+IGwBj0jxP6yyRAAm+wJVRyOfQEStxQUYPCyRL5B3SL086Ed1xUu2fktxVuU5/8a5FZfBehQTQ==
X-Received: by 2002:a05:600c:548d:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45201437aa8mr27346985e9.6.1749202837831;
        Fri, 06 Jun 2025 02:40:37 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1225:ec01:d1d7:779d:8019:7bb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73b8sm15003775e9.29.2025.06.06.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:40:37 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:40:35 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <binjodgavnupkl2plmnwjito4pu27uwwmhgwexlqq3diad3zj3@c2jotuzsq43o>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-1-0488e80dafcb@analog.com>
 <aECSL3cn3m9pKJv6@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aECSL3cn3m9pKJv6@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_024040_170407_D9B95C00 
X-CRM114-Status: GOOD (  21.26  )
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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

SGkgRnJhbmssCgpPbiBXZWQsIEp1biAwNCwgMjAyNSBhdCAwMjozNjozMVBNIC0wNDAwLCBGcmFu
ayBMaSB3cm90ZToKPiBPbiBXZWQsIEp1biAwNCwgMjAyNSBhdCAwNTo0ODo1N1BNICswMjAwLCBK
b3JnZSBNYXJxdWVzIHdyb3RlOgo+ID4gQWRkIG5vZGVzIGZvciBBREkgSTNDIENvbnRyb2xsZXIg
SVAgY29yZS4KPiAKPiBBZGQgYmluZGluZyBkb2MgZm9yIC4uLgo+IAo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KPiA+IC0tLQo+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sICAgIHwg
NjMgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDY4
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uODU5ZGJmZGUxNWYxMjNkYjU5ZDdhYTQ2YzEyMGM0YTNhYzA1MTk4ZQo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGks
aTNjLW1hc3Rlci55YW1sCj4gPiBAQCAtMCwwICsxLDYzIEBACj4gPiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ID4gKyVZQU1MIDEuMgo+
ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTNjL2FkaSxp
M2MtbWFzdGVyLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IEFuYWxvZyBEZXZpY2VzIEkzQyBD
b250cm9sbGVyCj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsgIFRoZSBBREkgSTNDIGNv
bnRyb2xsZXIgaW1wbGVtZW50cyBhIHN1YnNldCBvZiB0aGUgSTNDLWJhc2ljIHNwZWNpZmljYXRp
b24gdG8KPiA+ICsgIGludGVyZmFjZSBJM0MgYW5kIEkyQyBwZXJpcGhlcmFscyBbMV0uCj4gPiAr
Cj4gPiArICBbMV0gaHR0cHM6Ly9hbmFsb2dkZXZpY2VzaW5jLmdpdGh1Yi5pby9oZGwvbGlicmFy
eS9pM2NfY29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBKb3JnZSBN
YXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4gPiArCj4gPiArYWxsT2Y6Cj4gPiAr
ICAtICRyZWY6IGkzYy55YW1sIwo+ID4gKwo+IAo+IE5ldyBiaW5kaW5nLCBnZW5lcmFsbHksIGFs
bE9mIGJldHdlZW4gcmVxdWlyZWQgYW5kIHVuZXZhbHVhdGVkUHJvcGVydGllcwo+IAoKQWNrLgo+
ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogYWRpLGkz
Yy1tYXN0ZXIKPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+
ICsgIGNsb2NrczoKPiA+ICsgICAgbWluSXRlbXM6IDEKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogVGhlIEFYSSBpbnRlcmNvbm5lY3QgY2xvY2suCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogVGhlIEkzQyBjb250cm9sbGVyIGNsb2NrLgo+ID4gKwo+ID4gKyAgY2xv
Y2stbmFtZXM6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gY29uc3Q6IHNfYXhpX2FjbGsK
PiA+ICsgICAgICAtIGNvbnN0OiBpM2NfY2xrCj4gCj4gTmVlZG4ndCBfY2xrIHN1cmZpeCwKPiAK
PiAtIGNvbnN0OiBheGkKPiAtIGNvbnN0OiBpM2MKPiAKPiBGcmFuawoKQWNrLgoKQmVzdCBSZWdh
cmRzLApKb3JnZQo+ID4gKwo+ID4gKyAgaW50ZXJydXB0czoKPiA+ICsgICAgbWF4SXRlbXM6IDEK
PiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+
ICsgIC0gY2xvY2tzCj4gPiArICAtIGNsb2NrLW5hbWVzCj4gPiArICAtIGludGVycnVwdHMKPiA+
ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6
Cj4gPiArICAtIHwKPiA+ICsgICAgaTNjQDQ0YTAwMDAwIHsKPiA+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAiYWRpLGkzYy1tYXN0ZXIiOwo+ID4gKyAgICAgICAgcmVnID0gPDB4NDRhMDAwMDAgMHgx
MDAwPjsKPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8MCA1NiA0PjsKPiA+ICsgICAgICAgIGNs
b2NrcyA9IDwmY2xrYyAxNT4sIDwmY2xrYyAxNT47Cj4gPiArICAgICAgICBjbG9jay1uYW1lcyA9
ICJzX2F4aV9hY2xrIiwgImkzY19jbGsiOwo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
Mz47Cj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsKPiA+ICsgICAgICAgIC8q
IEkzQyBhbmQgSTJDIGRldmljZXMgKi8KPiA+ICsgICAgfTsKPiA+IGRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiBpbmRleCA5NmI4MjcwNDk1MDE4NGJkNzE2MjNmZjQx
ZmM0ZGYzMWU0YzdmZTg3Li42ZjU2ZTE3ZGNlY2Y5MDJjNjgxMjgyN2MxZWMzZTA2N2M2NWU5ODk0
IDEwMDY0NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiBA
QCAtMTEyNDMsNiArMTEyNDMsMTEgQEAgUzoJTWFpbnRhaW5lZAo+ID4gIEY6CURvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYXNwZWVkLGFzdDI2MDAtaTNjLnlhbWwKPiA+ICBG
Oglkcml2ZXJzL2kzYy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKPiA+Cj4gPiArSTNDIERS
SVZFUiBGT1IgQU5BTE9HIERFVklDRVMgSTNDIENPTlRST0xMRVIgSVAKPiA+ICtNOglKb3JnZSBN
YXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4gPiArUzoJTWFpbnRhaW5lZAo+ID4g
K0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIu
eWFtbAo+ID4gKwo+ID4gIEkzQyBEUklWRVIgRk9SIENBREVOQ0UgSTNDIE1BU1RFUiBJUAo+ID4g
IE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KPiA+ICBTOglNYWludGFpbmVk
Cj4gPgo+ID4gLS0KPiA+IDIuNDkuMAo+ID4KPiAKPiAtLSAKPiBsaW51eC1pM2MgbWFpbGluZyBs
aXN0Cj4gbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK

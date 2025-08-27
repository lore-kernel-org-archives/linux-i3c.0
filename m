Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C09CA0FED
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ob0sj9hXgQK4lg1QAGK5ESBPPs1mQ9c48eTQSs67E8=; b=RCA3BMhlkG73zT
	KJPjKCBJtWCPZRcYhQvnOpWGcoBajouiknTi6tGOXrDtr0cI3f9sJpK0RRUtz/soX0tVMyvVKHZL1
	ZG0kGUEI0yNEGXSrBBEXOrWoVGem5XFymVCeuX3LPu3/8jTdCDGNzcKL2GGePb24ckUPtYOzZEx6M
	YriUdJ2yGG1Z2A5w7rwbsJiqRXIF+6OeQT/gCD+Sw+LZTUVU5E6XIZrHslNUFS5Z2VLXGGGdSqQxo
	oJcabJoZ0zdHJlp2FimkK65jdqKCTdhLlrZx8DKomhgcJ0dSiXLQQprpGAo6MY/ojC4s8p3VctCdc
	mRvStaTnG7z6Fy2SubBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQa-0000000G0rn-2Fsd;
	Wed, 27 Aug 2025 15:51:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urF17-0000000FOIY-21oN
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 12:12:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso50835645e9.1
        for <linux-i3c@lists.infradead.org>; Wed, 27 Aug 2025 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756296759; x=1756901559; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3fqtEW6MzsEkiAa8sZI303qQp8qzeB/9P13/CzJ1Hgc=;
        b=bXREtIc+JKWXQS72nmvHNYBMogZH88PJH10Hj/2Eds8hhLNB89V8CDPdv3llDykCTG
         P6kIILfvNCs09SnNAM+JG38nJVRE+X4mom1SPzcaj+y4X8XTPH49sySC0D8znCGD3D/V
         j3O8ttYZbVl5mh10CZD3vn6G5OKRo3CTF35DG4p7GErffHKiyc8VPiC7qLLQy2S49Xpl
         QDIC8oXv+GnHFXlPE7uSerNzBPgsFXCaQsdCdVo569/jHfRMu6D1E1ii0Ep+SbhEIzKx
         /idb8DLOT0EI6+sCiXwQhGhFqkP4E+0qjDNV16x2KHUHjpzxA3xKyA83GAOWevqtsNNN
         oHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296759; x=1756901559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3fqtEW6MzsEkiAa8sZI303qQp8qzeB/9P13/CzJ1Hgc=;
        b=Wi9EjjteFoWRyUMGPZHLKcgN1SypAepVAGzYzHiKvqC1sfy2hmMKvgEmSTkCLNt3XJ
         IMOKfA+gAneahfD4aofpIoPauE1MZ60cCuay9TaXKSaZovoM+4Jhz837/ufVg0ZC7IYk
         oOJgax2blNbvmWIP53cn5BCDqTMDuFHUax6jxWaLOI9bGduXU7ldlPy9PgTMF1jLpUKt
         UlfdOFwGQ1xHW793i/uDljlk7Hpq8H5cxljM+z6Stzyezqkn9220kAFYG3jXQiOlrI4O
         tCbOnwD7FxpD7DwK6/h86WFP9TMWc23mNUzJI5obmNETtdPiQz6iMH8xPCaEaiT/c4cO
         1pvA==
X-Forwarded-Encrypted: i=1; AJvYcCUOAXhZUFHGu2Iez0Hx5lAY9Z9+CUB30hw3OHZKxOSoZRPrA4VWs8Ow27/kjhMTHussz8SP9lZmov8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZRXSoMf+BVbK4lA9CGSQCYJ8hwRW/VzHmAWadEl+SJT+odqCB
	pes5Ojx4MQGRJO6p5K88OYKFjxFNPXoDGhL31EzLvkjpZB1zqdJms11K4x+LzJb8DD5x9g==
X-Gm-Gg: ASbGncsdYBZ9B+c76IfgZlZaLwFe5jcS2VXCH4H+w0x4l/oRmX6I6PnQx4fwCE2MFc9
	CQ9KKayS1DscCiLL+cEEtEkyydAW47r0XSJmGb6hObZnj8fTiCWkWFe7RBVy3QR5o2skRheumRB
	+gtV6g4MRGB/iKnzLtHsYpFdR+JdqNjeUHkjCQb0AnrE5SiMqV7bsjmVPIlnbzKh6DeUDBmg25O
	SgClExy2saFPsJhl6ZTQtL/nD67Okn8h12nC+IqvUua0I3gtjPRO8pnxjfJ1Jj06nPfiTNWwW/y
	mE+1bmwKPlU0dIx+W5syynxsdyKqPzIOwakPZg2R0upLPrP3HU/w2xvTCvWt1XkmtKpiPqGsy1h
	Xay8Rz4941N0rFhudVuoHC6KYtPtuBecbbEz+w5Zvvn+LokMkVcCfirDXFSoGiQ2Yuy7D/ddBcn
	U4KZ0yibGg/A==
X-Google-Smtp-Source: AGHT+IHCen0twgH6SvYKDmE3fl0I5US28XRM01Jr2EAWZqrWDSRoLBba6HDsA3DR9QxoWEzXw8khSQ==
X-Received: by 2002:a05:600c:1d28:b0:45b:6285:e22a with SMTP id 5b1f17b1804b1-45b6f30756dmr19899945e9.23.1756296759064;
        Wed, 27 Aug 2025 05:12:39 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cd2e01dd9dsm1237895f8f.60.2025.08.27.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:12:38 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:12:35 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <5zd2lxv25pza33opo4khevfwna2iqjbe4jb3t4mo473sjgxuou@o3glpcmohmun>
References: <20250818-adi-i3c-master-v7-0-f7207902669d@analog.com>
 <20250818-adi-i3c-master-v7-1-f7207902669d@analog.com>
 <aK3XIUpVZYmHGiUz@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aK3XIUpVZYmHGiUz@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_051241_522935_15C6F757 
X-CRM114-Status: GOOD (  23.29  )
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

T24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTE6NDc6NDVBTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMDE6NTE6MTNQTSArMDIwMCwgSm9yZ2UgTWFycXVl
cyB3cm90ZToKPiA+IEFkZCBiaW5kaW5ncyBkb2MgZm9yIEFESSBJM0MgQ29udHJvbGxlciBJUCBj
b3JlLCBhIEZQR0Egc3ludGhlc2l6YWJsZSBJUAo+ID4gY29yZSB0aGF0IGltcGxlbWVudHMgdGhl
IE1JUEkgSTNDIEJhc2ljIGNvbnRyb2xsZXIgc3BlY2lmaWNhdGlvbi4KPiA+IFRoZSBJUCBDb3Jl
IGlzIHZlcnNpb25lZCBmb2xsb3dpbmcgU2VtYW50aWMgVmVyc2lvbmluZyAyLjAuMCBhbmQKPiA+
IEFESSdzIG9wZW4tc291cmNlIEhETCBndWlkZWxpbmVzIGZvciBkZXZpY2V0cmVlIGJpbmRpbmdz
IGFuZCBkcml2ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvcmdlIE1hcnF1ZXMgPGpvcmdl
Lm1hcnF1ZXNAYW5hbG9nLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kzYy9hZGksaTNjLW1hc3Rlci55YW1sICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKwo+
ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDUgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1h
c3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNj
LW1hc3Rlci55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZmRhMjQwZjllZTBjNzNiY2JlYTk3Zjc3
NWQ2ZTA4MWZlMGMwODlkOQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCj4gPiBAQCAtMCww
ICsxLDcyIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+IC4uLgo+ID4gKwo+ID4gKyAg
Y2xvY2tzOgo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBUaGUgQVhJIGludGVyY29ubmVjdCBjbG9jaywgZHJpdmVzIHRoZSByZWdp
c3RlciBtYXAuCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogfAo+IAo+IE5lZWRuJ3QgfCBoZXJl
Lgo+IAo+IEZyYW5rCgpBY2sKCkJlc3QgcmVnYXJkcywKSm9yZ2UKPiA+ICsgICAgICAgICAgVGhl
IHNlY29uZGFyeSBjbG9jaywgZHJpdmVzIHRoZSBpbnRlcm5hbCBsb2dpYyBhc3luY2hyb25vdXNs
eSB0byB0aGUKPiA+ICsgICAgICAgICAgcmVnaXN0ZXIgbWFwLiBUaGUgcHJlc2VuY2Ugb2YgdGhp
cyBlbnRyeSBzdGF0ZXMgdGhhdCB0aGUgSVAgQ29yZSB3YXMKPiA+ICsgICAgICAgICAgc3ludGhl
c2l6ZWQgd2l0aCBhIHNlY29uZCBjbG9jayBpbnB1dCwgYW5kIHRoZSBhYnNlbmNlIG9mIHRoaXMg
ZW50cnkKPiA+ICsgICAgICAgICAgaW5kaWNhdGVzIGEgdG9wb2xvZ3kgd2hlcmUgYSBzaW5nbGUg
Y2xvY2sgaW5wdXQgZHJpdmVzIGFsbCB0aGUKPiA+ICsgICAgICAgICAgaW50ZXJuYWwgbG9naWMu
Cj4gPiArCj4gPiArICBjbG9jay1uYW1lczoKPiA+ICsgICAgbWluSXRlbXM6IDEKPiA+ICsgICAg
aXRlbXM6Cj4gPiArICAgICAgLSBjb25zdDogYXhpCj4gPiArICAgICAgLSBjb25zdDogaTNjCj4g
PiArCj4gPiArICBpbnRlcnJ1cHRzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gK3Jl
cXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIHJlZwo+ID4gKyAgLSBjbG9ja3MK
PiA+ICsgIC0gY2xvY2stbmFtZXMKPiA+ICsgIC0gaW50ZXJydXB0cwo+ID4gKwo+ID4gK2FsbE9m
Ogo+ID4gKyAgLSAkcmVmOiBpM2MueWFtbCMKPiA+ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRp
ZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4gKwo+ID4gKyAg
ICBpM2NANDRhMDAwMDAgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksaTNjLW1hc3Rl
ci12MSI7Cj4gPiArICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+Owo+ID4gKyAgICAg
ICAgaW50ZXJydXB0cyA9IDwzIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ID4gKyAgICAgICAgY2xv
Y2tzID0gPCZjbGtjIDE1PiwgPCZjbGtjIDE1PjsKPiA+ICsgICAgICAgIGNsb2NrLW5hbWVzID0g
ImF4aSIsICJpM2MiOwo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gPiArICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsKPiA+ICsgICAgICAgIC8qIEkzQyBhbmQgSTJD
IGRldmljZXMgKi8KPiA+ICsgICAgfTsKPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCj4gPiBpbmRleCAzNWVkODQ5OGFiMWU5YjkyYjRiY2U1ZGI5YmI2NDAwNGQ4MGU0
YjFhLi5mYWE1MDUzNWI1MTQwMzdkZGY5NzMwOTg3NGVjNjRhYWMyMDEzY2I2IDEwMDY0NAo+ID4g
LS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiBAQCAtMTE0NTIsNiAr
MTE0NTIsMTEgQEAgUzoJTWFpbnRhaW5lZAo+ID4gIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pM2MvYXNwZWVkLGFzdDI2MDAtaTNjLnlhbWwKPiA+ICBGOglkcml2ZXJzL2kz
Yy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKPiA+Cj4gPiArSTNDIERSSVZFUiBGT1IgQU5B
TE9HIERFVklDRVMgSTNDIENPTlRST0xMRVIgSVAKPiA+ICtNOglKb3JnZSBNYXJxdWVzIDxqb3Jn
ZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4gPiArUzoJTWFpbnRhaW5lZAo+ID4gK0Y6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbAo+ID4gKwo+
ID4gIEkzQyBEUklWRVIgRk9SIENBREVOQ0UgSTNDIE1BU1RFUiBJUAo+ID4gIE06CVByemVteXPF
gmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KPiA+ICBTOglNYWludGFpbmVkCj4gPgo+ID4gLS0K
PiA+IDIuNDkuMAo+ID4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==

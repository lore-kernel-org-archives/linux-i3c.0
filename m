Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F5C4828F
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Feb 2024 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsZ3c6OR53/LSoIe7ZztpEtH3D8Z1DD9o9b07y3d3dE=; b=G6ls9CoV5aGU/m
	OeDO7MGTa7EVRD0UQCDhBRz7dWuJBqncEMo5+NWx9TPFTxTkQ/mZnJ3S6MQuwyDqRSsiR/Bgww0S6
	WMw2+4X2H3m97PHkEdsZIwfUEPy5dn4iV66jcc5v/+YBSVpUEhjxEB+Bg6RUGrdszyGCyPvM9KezX
	jYpUmmhBcbKSf5AevPQ544uCqybFo5tBxQ/rmV44Gzw1hoYcm7J8lyb6OLSMj3oqifpqm/zmPrnSf
	Nsnw3n+phGE7Pzw43sNn3dRfxHPom9XErzhSJpHiwZwQWQUl3xpeYVoxVaap0szuWKBohN/3g84/E
	uqJHvYXJWSzYb4qQcymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7mg-0000000EO2W-2cIu;
	Thu, 08 Feb 2024 17:01:58 +0000
Received: from mail-vi1eur05on20601.outbound.protection.outlook.com ([2a01:111:f403:2613::601] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7mc-0000000ENy9-0noH
	for linux-i3c@lists.infradead.org;
	Thu, 08 Feb 2024 17:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS3w7phlgUg7l7Tp4hEE9LUCUXKawYbfYsAucE+1PMV4x7oQEttgjV31HhL+I/BNu6Etj9/ULYBfq4s/MJkOtDGsk9trbd5gYyofYi6XB3DvvpDMC/r/RofkTdJeGOh2tzICtRJjjY6n09L1FzKeJG4sZUjhvot1fSC1Mq7XPQxmwg2WZff0+cZRn1v5mEvsNpjmnud/DnyrF0KwdqwMZVJ07pbrJp/vHHew06jod/um/hTYrcbT74JgArARyz4dqfxeurFPOaiBcRTXIFAetDjYEyNsPUoex6UvkKyk2oWR0CSEmdBVfa01/Qnmr28sd7golZR64DRzbArEkflh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV44oIZVXxGjMUN038mXUA0fEvu2yZSoG67eTDt2HkM=;
 b=iiKCfDtM/SRY68uSmv4/dFkCh3k7M5kkE+yULYwq8fhz6TB6O/QSeQo93C5luuM5U2rjEK2NmFbOO8q7P8OlmPnoYB+ifOg4j3ZbDBFS/RS+wdYw1015Cf2cxUPFfFmKcMuh3FOM8S05fjxtrt/Qxe3z3nJNAP6r4GozeIpV6bJbxFUw67rId8vJc0zoxOMXO1N3+BWn0s53QOorX90VTVBdyJbZBXDW2/4mG601gT+y4verHpYFA642AEm7D0M/yONrtS3OD1pavSKmJpMbxr3dV6N2h7rPA7ZaaZZZ7tiSsprq5Res9awqxYCd3eaolyu5DL+vw2eQ7qVzdlrUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV44oIZVXxGjMUN038mXUA0fEvu2yZSoG67eTDt2HkM=;
 b=aDAbJWAhV3DECOeYqLUYvrt8fwI99fpt+vx2CP2VRlC0pXdG+EsGSSTZfCV9iK6VIIhhggAVW6J8DHWNrwWRaoOOu/ZKeHfOHMz5icEb5A0+KE2Njk3THYQtmaHW4oswYuRK+1mNbNXlm3GMw2mqxSnx/+fuLFTUY570evozg9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9248.eurprd04.prod.outlook.com (2603:10a6:102:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 17:01:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 17:01:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com
Cc: alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com,
	robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH v8 0/8] I3C target mode support
Date: Thu,  8 Feb 2024 12:01:09 -0500
Message-Id: <20240208170117.798357-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a65b08-4f16-4c28-94ae-08dc28c79b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UhlbusNTMBw31RFGmtPyEaORzj8cMxHJzdMc9vbII2p/2okJG5tk0pHKaGGSOrNK/st0/vqmJGFEYssFQpbxxFebGltLBEQqUV4nQyvs2/2NEekuY9bbOWiy0/Fs5iIgk/fWplZ3nEKvIsgtCq5Ufmq+YNivlr75MStF0lyXp0hEy3hCSif+cddha2L14Eo4KRTjdoSflyhPftZLZPGTwobUzA3tA0dBQqzmWvua18hs2dRhmSM2B821O/0zSkUd8Hm70p0MkXgdOQXcHSrygehp/xYOAomthi/po2LxUSAVm5hUrGKSwhV4mrhv6oe/rwqkZYE5q/Oo6TgDG6675WYqidRKNTP2dwRkZXOa/Rh0PQErLHizGVUJcQ4G3V0KtXN2k2lfcqV8yX1qOYzcSw1V6vy0j0GPo+gqAEfH8x6thIUnRANzf6dvgyl8fl+2/PWLLMNa4ttBxWzVorSKPYZCUDTBwNzInSNTdCJZUfs0sZe7MektF6uLCLTfGWiomtqbyPDH7pGgO2AABIPKmw4e2yXxqqQnSgzHL4LY55UNUo+CkslQoFcHJ3C7uO7LYhNmzaYEjtQQ/ukUeK2LYCb/TdXkJEuWWEpXLcUU7RI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(38100700002)(6666004)(52116002)(6506007)(83380400001)(37006003)(66574015)(86362001)(7416002)(41300700001)(1076003)(2616005)(26005)(34206002)(6512007)(36756003)(8676002)(8936002)(4326008)(6486002)(478600001)(2906002)(5660300002)(66476007)(66946007)(316002)(66556008)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0tNUVIva1NuaXRkZ0VqRWZiaTNvUDh0elkzOXZ0a3ZNVWF3RXhSZW5zWXhE?=
 =?utf-8?B?c2doOWpHb2dsbzY5WGdSa0NGdDRkdkFUQktJQi90ZnU4N3dQNXFDM0pQYVd2?=
 =?utf-8?B?OTJzcmI0L3ZtSEM4ZmEwNTZrREVEOEN1OTdtYkI3TlprakF6V1NpdUdPbk5n?=
 =?utf-8?B?T1BzbGd2aDhONDhVV3AvdkdCSmtNSzllWFlEMDg5S0M1ZDYxMWN4ZkFUeWw2?=
 =?utf-8?B?aEc2eUkrazlSWGlic3NsUUU5V21uV3FoM2MzMG9mQkNIK3FxRjUrcWh3WUF6?=
 =?utf-8?B?QmI1dC8rWFdUWTA0d2lZZzd5Y2R3eEF5OFBVdENFWmFqaHBqNnd3UXpURGFR?=
 =?utf-8?B?MlJtM0xlYWZra0Y4bkovenNib0gxMG4vc1liWVpFem14c3VmbkU4RGlnbUZ0?=
 =?utf-8?B?UHFTYnhFSXFFOVVUYUhVOHNRTFpod2hzWDhIT0IrUDFvZFcwc0xsRXovNXJ3?=
 =?utf-8?B?SnJteFg1b3BYNmcxdDNMYXY1T1BuNktsdFhJOUxTVXFCVnFqNkt0eElNQno5?=
 =?utf-8?B?UGNDdU5YOURKWEFsdTFHUCtOK0tLM0huKy81NGpReHNYU2J0QWRoMGpvS29m?=
 =?utf-8?B?b3docTRndGtJOGlVWG95eUF5a1daZHM5Sy9XVkpKVlNSeHBZWHJ1UkZ1dkFM?=
 =?utf-8?B?a1QxemNlUUdlSStuUUN5M2ZWVnYvVFI4V1pCUnlFb1NOK3pWUU81Z0doV1pk?=
 =?utf-8?B?UHRtLzgvVXp5UkI5UFZvSldSV0Z0WDUrbUo0elFTMWFhbHllNEwvNWo4ckdh?=
 =?utf-8?B?TDE3WllzMm9UTjFVMW9jY2RnM0YxS0N4SlIrd21aMVBOSlZ2bFZWZFJGNTZh?=
 =?utf-8?B?WGlrQVVQQ2hPakt1RWpiclVwMjhVUzlhV3VIanRXQmlvZUhMU3EvVDc4a0tZ?=
 =?utf-8?B?dy95d2lSL2hnSXp2Y3paL2duZW8vanBWcmlYOVEzNzUxeVZseG5jdUFzcU10?=
 =?utf-8?B?T0dVZXJKazJQTlFPQVoxN21sMVp0c01jQ3NEQVdDMGJkWW0xbHlMMERLWDMv?=
 =?utf-8?B?MkVNWTdjdVFmcTB3SGFDYTdyZFU5bHh2dll6dkZZWXY5dGFnMS9CZzV3YUxO?=
 =?utf-8?B?U1Zibm9namZYWjdvbmhVNU5rd3ZGdUlIeWZvRURUUmo5LzV2dzExZVBiRyta?=
 =?utf-8?B?dkw3Zk1vYkp3VWJsQ2kwMEtFTVM0UHJMbmZkRTBvcEZqaEFPVElJaE9xZkpw?=
 =?utf-8?B?ZTZzWkEzZS94ZklMY1dTZ01telhEWEh2RDJPRmxsYTR1cVRaR0lWVnpPV2dW?=
 =?utf-8?B?S1RFdmJIWWo3TE9TS0RCQzlCbDFvUk9XVi9SSEJoYkQvbWFWbG9ZRURiZkh4?=
 =?utf-8?B?QXlManF2RGRENjFlOTFpNDBpN05lYy9ZMnNVYVVIUi9GN2RIdnpiUm8vZzNn?=
 =?utf-8?B?YVpjVTZTVnArL3NRSlduL2o3TGNudkg4cSs0YlZ3d3NsK2w5cW8vNG9ON29T?=
 =?utf-8?B?bzgwVkV2WmYxQlV1enVkYkUxcyt3TGZqUitLa2dqUXBtN2tUd0V0ZHM5cGF0?=
 =?utf-8?B?WWltT0RkbEk5dk5qYk42UDJzVXpKS3IrMlNRdEwyMEIwZEdEY01yWncyU2Q0?=
 =?utf-8?B?REpKTkxKcXpQMGl0Y1lsc1BPd2ZMSkgranIzRk02Y1RJYytjTUgzSGY3Yklu?=
 =?utf-8?B?NTRvQ3dQZWtWMEM0blVLdDVkUDMvUHBSOTNtZURBWG8vNy9RQUtuTTBnTTE4?=
 =?utf-8?B?eHczNTlUYXpwUTM4cElUdVQrOUV6RzJBL2FGSWFzZjRSMkVjeFJ1RjZIYkRO?=
 =?utf-8?B?azcyRkQ1ZUNRRUFlZ3hZdThnSDRTOXJQYzEyWVJJVEM2dUYydW1MY2lES3FG?=
 =?utf-8?B?UVNvUEdKb0lyVU1mNjNVY2dvZzFUcUE1dnAwTFFla21wSGp2UWxwRkNvRHJk?=
 =?utf-8?B?ZlhuQkFqYUozRDNnWnRlemdaSUpLbmI0R09qampQdi95ai8wOEY2cnNKc2NO?=
 =?utf-8?B?enV1ZVVyNmNVQ2YvWFROQVR5MjhISWY1NG5ILzJPUytRSXFBOWlDOGNhdklK?=
 =?utf-8?B?eTkvWjRQcEtGVUx2OTBVQm91Y2lxYWFtUXpPRndodVdsS2MzSEZhcFAzazcw?=
 =?utf-8?B?d09IVFNLVVcvempjb0RJRk1SQUMrbkdtUEZ6RG1zS2xlSUJRRzEzMUNpb0w5?=
 =?utf-8?Q?XdMY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a65b08-4f16-4c28-94ae-08dc28c79b5c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 17:01:35.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yE6H7cY9ZhjUtUK4uNXVI7p3P/EiYUKdRUBp9FTAFwNbjPVxhYP9/YdT4XTY6K92JeEkrJ1dt34Qz+vC3V/ZOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090155_414812_4B8D374E 
X-CRM114-Status: GOOD (  16.38  )
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

VGhpcyAgcGF0Y2ggaW50cm9kdWNlcyBzdXBwb3J0IGZvciBJM0MgdGFyZ2V0IG1vZGUsIHdoaWNo
IGlzIHJlZmVyZW5jZWQKd2l0aCBhIFBDSWUgRW5kcG9pbnQgc3lzdGVtLiBJdCBhbHNvIGVzdGFi
bGlzaGVzIGEgY29uZmlndXJhdGlvbiBmcmFtZXdvcmsKKGNvbmZpZ2ZzKSBmb3IgdGhlIEkzQyB0
YXJnZXQgY29udHJvbGxlciBkcml2ZXIgYW5kIHRoZSBJM0MgdGFyZ2V0IGZ1bmN0aW9uCmRyaXZl
cgoKVHlwaWMgdXNhZ2UgYXMKClRoZSB1c2VyIGNhbiBjb25maWd1cmUgdGhlIGkzYy10YXJnZXQt
dHR5IGRldmljZSB1c2luZyBjb25maWdmcyBlbnRyeS4gSW4Kb3JkZXIgdG8gY2hhbmdlIHRoZSB2
ZW5kb3JpZCwgdGhlIGZvbGxvd2luZyBjb21tYW5kcyBjYW4gYmUgdXNlZAoKICAgICAgICAjIGVj
aG8gMHgwMTFiID4gZnVuY3Rpb25zL3R0eS9mdW5jMS92ZW5kb3JfaWQKICAgICAgICAjIGVjaG8g
MHgxMDAwID4gZnVuY3Rpb25zL3R0eS9mdW5jMS9wYXJ0X2lkCiAgICAgICAgIyBlY2hvIDB4NiA+
IGZ1bmN0aW9ucy90dHkvdC9iY3IKCkJpbmRpbmcgaTNjLXRhcmdldC10dHkgRGV2aWNlIHRvIHRh
cmdldCBDb250cm9sbGVyCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKSW4gb3JkZXIgZm9yIHRoZSB0YXJnZXQgZnVuY3Rpb24gZGV2aWNlIHRvIGJlIHVz
ZWZ1bCwgaXQgaGFzIHRvIGJlIGJvdW5kIHRvCmEgSTNDIHRhcmdldCBjb250cm9sbGVyIGRyaXZl
ci4gVXNlIHRoZSBjb25maWdmcyB0byBiaW5kIHRoZSBmdW5jdGlvbgpkZXZpY2UgdG8gb25lIG9m
IHRoZSBjb250cm9sbGVyIGRyaXZlciBwcmVzZW50IGluIHRoZSBzeXN0ZW06OgoKICAgICAgICAj
IGxuIC1zIGZ1bmN0aW9ucy9wY2lfZXBmX3Rlc3QvZnVuYzEgY29udHJvbGxlcnMvNDQzMzAwMDAu
aTNjLXRhcmdldC8KCkhvc3Qgc2lkZToKICAgICAgICBjYXQgL2Rldi90dHlJM0MwClRhcmV0IHNp
ZGU6CiAgICAgICAgZWNobyBhYmMgPi9kZXYvdHR5STNDMAoKTm90ZXMgYWJvdXQgaGVhZGVyIGZp
bGVzLgoKQWJvdXQgSWxwbyBKw6RydmluZW4ncyBoZWFkZXIgZmlsZSBjb21tZW50cywgaXQgY2Fu
IHBhc3MgYnVpbGQsIHNvbWUgaGVhZGVyCnNob3VsZCBiZSBpbmNsdWRlZCBieSBvdGhlciBoZWFk
ZXIgZmlsZXMuCgpJIGFkZGVkIHNvbWUsIGJ1dCBJIGFtIG5vdCBzdXJlIHRoYXQgaXMgYWxsIG5l
ZWRzLiBUaGVyZSBtYXkgaGF2ZSB0b29scywKd2hpY2ggY2FuIGhlbHAgY2hlY2ssIGJ1dCBJIGRv
bid0IGtub3cuCgpDaGFnbmUgZnJvbSB2MiB0byB2MwotIHVzaW5nICdtb2RlJyBkaXN0aW5naXVz
aCBtYXN0ZXIgYW5kIHRhcmdldC4KLSBtb3ZlIHN2Yy1pM2MtdGFyZ2V0LmMgdG8gdW5kZXIgbWFz
dGVyLAotIGJ1aWx0IHRvZ2V0aGVyIHdpdGggc3ZjLWkzYy1tYXN0ZXIuYwoKQ2hhbmdlIGZyb20g
djEgdG8gdjIKLSBjaGFuZ2UgInNsYXZlIiB0byAidGFyZ2V0IgotIGluY2x1ZGUgbWFzdGVyIHNp
ZGUgdHR5IHBhdGNoCi0gZml4ZWQgZHRiY2hlY2sgcHJvYmxlbQotIGZpeGVkIGtlcm5lLWRvYyBj
aGVjayB3YXJuaW5nCgpTb21lIHJldmlldyBjb21tZW50IG1heSBiZSBsb3N0IHNpbmNlIGl0IGlz
IHF1aXRlIGxvbmcgdGltZSBzaW5jZSB2MS4gTm93Cm1hc3RlciBzaWRlIGRlcGVuZGVudCBwYXRj
aGVzIGFscmVhZHkgaW4gbGludXgtbmV4dC4gU28gc2VudCB0YXJnZXQgc2lkZQpwYXRjaGVzIHdp
dGggdHR5IHN1cHBvcnQgYWdhaW4uCgpObyBzdXJlIHdoeSBhbiBhZGRpdGlvbmFsICJcclxuIiBh
cHBlbmRlZC4KCkZyYW5rIExpICg4KToKICBpM2M6IGFkZCB0YXJnZXQgbW9kZSBzdXBwb3J0CiAg
ZHQtYmluZGluZ3M6IGkzYzogc3ZjOiBhZGQgcHJvcHRlcnkgbW9kZQogIERvY3VtZW50YXRpb246
IGkzYzogQWRkIEkzQyB0YXJnZXQgbW9kZSBjb250cm9sbGVyIGFuZCBmdW5jdGlvbgogIGkzYzog
c3ZjOiBBZGQgc3ZjLWkzYy1tYWluLmMgYW5kIHN2Yy1pM2MuaAogIGkzYzogdGFyZ2V0OiBhZGQg
c3ZjIHRhcmdldCBjb250cm9sbGVyIHN1cHBvcnQKICBpM2M6IHRhcmdldDogZnVuYzogYWRkIHR0
eSBkcml2ZXIKICBpM2M6IGFkZCBBUEkgaTNjX2Rldl9nZXR0c3RhdHVzX2Zvcm1hdDEoKSB0byBn
ZXQgdGFyZ2V0IGRldmljZSBzdGF0dXMKICB0dHk6IGkzYzogYWRkIFRUWSBvdmVyIEkzQyBtYXN0
ZXIgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFzdGVyLnlhbWwgICAg
ICB8ICAxMSArLQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2kzYy9pbmRleC5yc3QgICAgICAg
IHwgICAxICsKIC4uLi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaTNjLXRhcmdldC1jZnMucnN0ICB8
IDEwOSArKysKIC4uLi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaTNjLXRhcmdldC5yc3QgICAgICB8
IDE4OSArKysrKwogLi4uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2MtdHR5LWhvd3RvLnJzdCAg
IHwgMTA5ICsrKwogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaW5kZXgucnN0
IHwgIDEzICsKIGRyaXZlcnMvaTNjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAzMSArLQogZHJpdmVycy9pM2MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICsKIGRyaXZlcnMvaTNjL2RldmljZS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
NCArCiBkcml2ZXJzL2kzYy9mdW5jL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDkg
KwogZHJpdmVycy9pM2MvZnVuYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAzICsK
IGRyaXZlcnMvaTNjL2Z1bmMvdHR5LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDQ4MSArKysr
KysrKysrKwogZHJpdmVycy9pM2MvaTNjLWNmcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
Mzg5ICsrKysrKysrKwogZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyNiArCiBkcml2ZXJzL2kzYy9tYXN0ZXIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
fCAgIDMgKy0KIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1haW4uYyAgICAgICAgICAgICB8
ICA4MCArKwogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgICAgICAgICAgIHwg
IDM0ICstCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy10YXJnZXQuYyAgICAgICAgICAgfCA3
NzYgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy5oICAgICAg
ICAgICAgICAgICAgfCAgMTUgKwogZHJpdmVycy9pM2MvdGFyZ2V0LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNDUzICsrKysrKysrKysKIGRyaXZlcnMvdHR5L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMyArCiBkcml2ZXJzL3R0eS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy90dHkvaTNjX3R0eS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNDMyICsrKysrKysrKysKIGluY2x1ZGUvbGludXgvaTNjL2RldmljZS5o
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2xpbnV4L2kzYy90YXJnZXQuaCAg
ICAgICAgICAgICAgICAgICAgfCA1NDggKysrKysrKysrKysrKwogMjYgZmlsZXMgY2hhbmdlZCwg
MzcyNCBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2MtdGFyZ2V0LWNmcy5yc3QKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2Mt
dGFyZ2V0LnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9p
M2MvdGFyZ2V0L2kzYy10dHktaG93dG8ucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaW5kZXgucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9pM2MvZnVuYy9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pM2Mv
ZnVuYy9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTNjL2Z1bmMvdHR5LmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2kzYy9pM2MtY2ZzLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYWluLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy10YXJnZXQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2kzYy90YXJnZXQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdHR5L2kzY190dHkuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvaTNjL3RhcmdldC5oCgotLSAKMi4zNC4x
CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
